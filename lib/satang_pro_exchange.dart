import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_satang_pro_exchange/dao/api_key/satang_pro_api_key.dart';
import 'package:flutter_satang_pro_exchange/dao/errors/satang_pro_error_dao.dart';
import 'package:flutter_satang_pro_exchange/dao/market_open_order/satang_pro_market_open_orders_dao.dart';
import 'package:flutter_satang_pro_exchange/dao/user_information/satang_pro_user_information_dao.dart';
import 'package:flutter_satang_pro_exchange/dao/user_open_orders/satang_pro_user_open_order_dao.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_auth_utils.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_order_type.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_utils.dart';
import 'package:http/http.dart' as http;

class SatangProExchangeService {
  static const String BASE_URL = "api.tdax.com";
  static const String POINT_API = "api/";

  /// Header content-type
  static const String FORM_URL_ENCODED = "application/x-www-form-urlencoded";

  /// Public API
  static const String END_POINT_MARKET_OPEN_ORDERS = "orders/";

  /// Private API
  static const String END_POINT_USER_INFORMATION = "users/";
  static const String END_POINT_OPEN_ORDERS = "orders/user";
  static const String END_POINT_CANCEL_ORDERS = "orders/";
  static const String END_POINT_CREATE_ORDERS = "orders/";

  /// User Id , You can get this id on developer menu.
  /// [https://satang.pro/developers]
  int userId;

  ///
  ///
  /// Api key for get general data.
  /// Required permission
  /// [Wallet] for get data balance and user information.
  ///
  SatangProApiKey apiKeyUserInfo;

  ///
  ///
  /// Api key for get order / create order / cancel order.
  /// Required permission
  /// [Order] for get data balance and transaction history.
  ///
  SatangProApiKey apiKeyOrder;

  SatangProExchangeService({this.userId, this.apiKeyUserInfo, this.apiKeyOrder});

  /// This is a [public] api.
  /// Get market open order bids and asks.
  Future<SatangProMarketOpenOrdersDao> fetchMarketOpenOrders({String pair = "btc_thb", bool printJson = false}) async {
    String url = Uri.https(BASE_URL, POINT_API + END_POINT_MARKET_OPEN_ORDERS, {"pair": pair}).toString();
    http.Response response = await http.get(url);
    var jsonResponse = json.decode(response.body);
    SatangProMarketOpenOrdersDao dao = SatangProMarketOpenOrdersDao.fromJson(jsonResponse);
    if (printJson) {
      print(url);
      printPrettyJson(dao.toJson());
    }
    return dao;
  }

  /// This is a [private] api.
  /// Get user's wallet info.
  Future<SatangProUserInformationDao> fetchUserInformation({bool printJson = false}) async {
    assert(apiKeyUserInfo != null, "Must provide User Info API KEY.");
    int nonce = getNonce();

    Map<String, String> payload = {};
    String payloadString = "";

    String signature = SatangProAuthUtils.generateSignature(apiKeyUserInfo, payloadString);
    Map header = SatangProAuthUtils.createHeader(signature: signature, key: apiKeyUserInfo);
    String url = Uri.https(BASE_URL, POINT_API + END_POINT_USER_INFORMATION + "$userId", payload).toString();
    http.Response response = await http.get(url, headers: header);
    var jsonResponse = json.decode(response.body);
    SatangProUserInformationDao dao;

    if (jsonResponse["Code"] == null) {
      dao = SatangProUserInformationDao.fromJson(jsonResponse);
    } else {
      dao = SatangProUserInformationDao();
      dao.error = SatangProErrorDao.fromJson(jsonResponse);
    }

    if (printJson) {
      print(url);
      print("signature = " + signature);
      print("header = " + header.toString());
      printPrettyJson(dao.toJson());
    }
    return dao;
  }

  /// This is a [private] api.
  /// Get current open orders.
  Future<SatangProUserOpenOrderDao> fetchOrders(
      {int limit = 100, int offset = 0, String pair = "btc_thb", SatangProOrderType orderType = SatangProOrderType.SELL, String status = "all", bool printJson = false}) async {
    assert(apiKeyOrder != null, "Must provide Order API KEY.");

    Map<String, String> payload = {"limit": "$limit", "offset": "$offset", "pair": "$pair", "side": "${fromSatangProOrderTypeToString(orderType)}", "status": "$status"};
    String payloadString = "";

    String signature = SatangProAuthUtils.generateSignature(apiKeyOrder, payloadString);
    Map header = SatangProAuthUtils.createHeader(signature: signature, key: apiKeyOrder);

    String url = Uri.https(BASE_URL, POINT_API + END_POINT_OPEN_ORDERS, payload).toString();
    http.Response response = await http.get(url, headers: header);

    SatangProUserOpenOrderDao openOrder;
    try {
      List jsonResponse = json.decode(response.body);
      openOrder = SatangProUserOpenOrderDao.fromJson(jsonResponse);
    } catch (e) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse["Code"] != null) {
        openOrder = SatangProUserOpenOrderDao();
        openOrder.error = SatangProErrorDao.fromJson(jsonResponse);
      }
    }

    if (printJson) {
      print(url);
      print("signature = " + signature);
      print("header = " + header.toString());
      print("payloadString = " + payloadString);

      if (openOrder.isError) {
        printPrettyJson(openOrder.error.toJson());
      } else {
        printPrettyJson(openOrder.toJson());
      }
    }

    return openOrder;
  }

  /// This is a [private] api.
  /// cancel order that opened.
  Future cancelOrder({@required int orderId, bool printJson = false}) async {
    assert(apiKeyOrder != null, "Must provide Order API KEY.");

    Map<String, String> payload = {};
    String payloadString = "";

    String signature = SatangProAuthUtils.generateSignature(apiKeyOrder, payloadString);
    Map header = SatangProAuthUtils.createHeader(signature: signature, key: apiKeyOrder);

    String url = Uri.https(BASE_URL, POINT_API + END_POINT_CANCEL_ORDERS + "$orderId", payload).toString();
    http.Response response = await http.delete(url, headers: header);

    if (printJson) {
      print(url);
      print("signature = " + signature);
      print("header = " + header.toString());
      print("payloadString = " + payloadString);
      print(response.body);
    }
  }

  /// This is a [private] api.
  /// Create open orders.
  Future createOrder({String pair = "btc_thb", @required SatangProOrderType orderType, @required price, @required amount, bool printJson = false}) async {
    assert(apiKeyOrder != null, "Must provide Order API KEY.");

    int nonce = getNonce();
    Map<String, String> payload = {"amount": "$amount", "nonce": "$nonce", "pair": "$pair", "price": "$price", "side": "${fromSatangProOrderTypeToString(orderType)}","type":"limit"};
    String payloadString = "amount=$amount&nonce=$nonce&pair=$pair&price=$price&side=${fromSatangProOrderTypeToString(orderType)}&type=limit";

    String signature = SatangProAuthUtils.generateSignature(apiKeyOrder, payloadString);
    Map header = SatangProAuthUtils.createHeader(signature: signature, key: apiKeyOrder);

    String url = Uri.https(BASE_URL, POINT_API + END_POINT_CREATE_ORDERS).toString();
    http.Response response = await http.post(url, headers: header, body: payload);

//    SatangProUserOpenOrderDao openOrder;
//    try {
//    var jsonResponse = json.decode(response.body);
    print(response.body);
    print(payload);
//      openOrder = SatangProUserOpenOrderDao.fromJson(jsonResponse);
//    } catch (e) {
//      var jsonResponse = json.decode(response.body);
//      if (jsonResponse["Code"] != null) {
//        openOrder = SatangProUserOpenOrderDao();
//        openOrder.error = SatangProErrorDao.fromJson(jsonResponse);
//      }
//    }

    if (printJson) {
      print(url);
      print("signature = " + signature);
      print("header = " + header.toString());
      print("payloadString = " + payloadString);

//      if (openOrder.isError) {
//        printPrettyJson(openOrder.error.toJson());
//      } else {
//        printPrettyJson(openOrder.toJson());
//      }
    }

//    return openOrder;
  }
}
