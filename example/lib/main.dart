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
      apiKeyUserInfo: SatangProApiKey(apiKey: "live-bb7004c453c747dab95fe8b16d5c9a5e", secret: "b34a2Mr3RAqAkHcwnC+OTDeigz71VEFGsYTxtY+limA="));

  await sp.fetchUserInformation(printJson: true);


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
