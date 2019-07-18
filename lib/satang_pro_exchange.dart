import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_satang_pro_exchange/dao/api_key/satang_pro_api_key.dart';
import 'package:flutter_satang_pro_exchange/dao/market_open_order/satang_pro_market_open_orders_dao.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_auth_utils.dart';
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

  /// User Id , You can get this id on developer menu.
  /// [https://satang.pro/developers]
  int userId;

  ///
  ///
  /// Api key for get general data.
  /// Required permission
  /// [Balances] for get data balance and transaction history.
  /// [Deposit] for get deposit address on wallet.
  /// Recommend [disable] 2FA on this key.
  ///
  SatangProApiKey apiKeyGeneral;

  SatangProExchangeService({this.userId, this.apiKeyGeneral});

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
  Future fetchUserInformation({bool printJson = false}) async {
    int nonce = getNonce();

//    Map<String, String> payload = {"Nonce": "$nonce"};
//    String payloadString = "Nonce=$nonce";
//
//    String signature = SatangProAuthUtils.generateSignature(apiKeyGeneral, payloadString);
//    Map header = SatangProAuthUtils.createHeader(signature: signature, key: apiKeyGeneral);
//    String url = Uri.https(BASE_URL, POINT_API + END_POINT_USER_INFORMATION + "$userId", payload).toString();
//    http.Response response = await http.get(url, headers: header);
//    var jsonResponse = json.decode(response.body);
//    SatangProMarketOpenOrdersDao dao = SatangProMarketOpenOrdersDao.fromJson(jsonResponse);
    if (printJson) {
//      print(url);
//      print("signature = " + signature);
//      print("header = " + header.toString());
//      printPrettyJson(jsonResponse);
    print(nonce);
    }
//    return dao;
  }
}
