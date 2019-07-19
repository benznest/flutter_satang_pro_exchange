import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_satang_pro_exchange/dao/api_key/satang_pro_api_key.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_exchange.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_order_type.dart';

Future main() async {
//  SatangProExchangeService sp = SatangProExchangeService(userId: 7892,
//      apiKeyGeneral: SatangProApiKey(
//          apiKey: "live-510d4e8081ec49fabcbc50e13e8db403",
//          secret:"R3Wj9ar6Rfm95wOvF0bNDfGTl7Y+o0wai+wdyerzEFo="));

  SatangProExchangeService sp = SatangProExchangeService(
      userId: 7892,
      apiKeyUserInfo: SatangProApiKey(apiKey: "live-0e693ba1952e4a618b5f4936a19afd7f", secret: "lJCTDXJTQm+0eLvXBZkiHZHD9E0OZUGAjipCh70OLDA="),
      apiKeyOrder: SatangProApiKey(apiKey: "live-0e693ba1952e4a618b5f4936a19afd7f", secret: "lJCTDXJTQm+0eLvXBZkiHZHD9E0OZUGAjipCh70OLDA="));

//  await sp.fetchUserInformation(printJson: true);

  await sp.createOrder(orderType: SatangProOrderType.BUY,amount: 0.0005 ,price: 10000, printJson: true);
  await sp.fetchOrders(orderType: SatangProOrderType.BUY,printJson: true);
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
