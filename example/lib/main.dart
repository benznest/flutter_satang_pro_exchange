import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_satang_pro_exchange/dao/api_key/satang_pro_api_key.dart';
import 'package:flutter_satang_pro_exchange/dao/market_open_order/satang_pro_market_open_orders_dao.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_currency.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_exchange.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_order_type.dart';

Future main() async {

  var sp = SatangProExchangeService(
      userId: 7892,
      apiKeyUserInfo: SatangProApiKey(apiKey: "", secret: ""),
      apiKeyOrder: SatangProApiKey(apiKey: "", secret: ""));

//  var market = await sp.fetchMarketOpenOrders(pair: SatangProCurrency.BTC_THB);
//  var myOrders = await sp.fetchOrders(pair: "btc_thb",orderType: SatangProOrderType.BUY, printJson: true);

//  await sp.createOrder(pair: SatangProCurrency.BTC_THB,
//      orderType: SatangProOrderType.BUY,
//      amount: 0.0005,
//      price: 10000);

//  await sp.cancelOrder(orderId: 18916446, printJson: true);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SATANG PRO'),
        ),
        body: Center(
          child: Text('SATANG PRO'),
        ),
      ),
    );
  }
}
