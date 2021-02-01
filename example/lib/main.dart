import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_satang_pro_exchange/dao/api_key/satang_pro_api_key.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_exchange.dart';

Future main() async {

  SatangProExchangeService sp = SatangProExchangeService(
      userId: 7892,
      apiKeyUserInfo: SatangProApiKey(apiKey: "", secret: ""));

  await sp.fetchMarket(printJson: true);

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
