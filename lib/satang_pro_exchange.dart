import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_satang_pro_exchange/dao/api_key/satang_pro_api_key.dart';

class SatangProExchangeService {
  static const String BASE_URL = "api.tdax.com/";
  static const String POINT_API = "api/";

  /// Header content-type
  static const String FORM_URL_ENCODED = "application/x-www-form-urlencoded";

  /// Public API
  static const String END_POINT_SERVER_TIME = "servertime/";
  static const String END_POINT_MARKET_SYMBOLS = "market/symbols/";

  /// Private API
  static const String END_POINT_WALLET_BALANCE = "market/balances/";

  ///
  ///
  /// Api key for get general data.
  /// Required permission
  /// [Balances] for get data balance and transaction history.
  /// [Deposit] for get deposit address on wallet.
  /// Recommend [disable] 2FA on this key.
  ///
  SatangProApiKey apiKeyGeneral;

  SatangProExchangeService({this.apiKeyGeneral});


/// This is a [public] api.
  /// Get server timestamp.
//  Future<BitKubServerTimeDao> fetchServerTime({bool printJson = false}) async {
//    String url = Uri.https(BASE_URL, POINT_API + END_POINT_SERVER_TIME).toString();
//    http.Response response = await http.get(url);
//    int serverTime = int.parse(response.body);
//
//    BitKubServerTimeDao dao = BitKubServerTimeDao(serverTime: serverTime);
//    if (printJson) {
//      print(url);
//      printPrettyJson(dao.toJson());
//    }
//    return dao;
//  }

}
