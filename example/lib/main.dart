import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_satang_pro_exchange/dao/api_key/satang_pro_api_key.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_exchange.dart';

Future main() async {
  SatangProExchangeService sp = SatangProExchangeService(userId: 7892,
      apiKeyGeneral: SatangProApiKey(
          apiKey: "live-510d4e8081ec49fabcbc50e13e8db403",
          secret:"R3Wj9ar6Rfm95wOvF0bNDfGTl7Y+o0wai+wdyerzEFo="));
//  await sp.fetchMarketOpenOrders(printJson: true);
  await sp.fetchUserInformation(printJson: true);

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
