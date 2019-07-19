import 'package:flutter_satang_pro_exchange/dao/wallets/satang_pto_wallet_dao.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_currency_manager.dart';

class SatangProUserWalletDao {
  List<SatangProWalletDao> wallets;

  SatangProUserWalletDao({this.wallets});

  factory SatangProUserWalletDao.fromJson(Map<String, dynamic> json) {
    List<SatangProWalletDao> list = List();
    for (String symbol in SatangProCurrencyManager.LIST_CURRENCY_AVAILABLE) {
      if (json[symbol] != null) {
        list.add(SatangProWalletDao.fromJson(symbol, json[symbol]));
      }
    }

    return SatangProUserWalletDao(wallets: list);
  }

  List toJson() {
    return wallets.map((item) => item.toJson()).toList();
  }
}
