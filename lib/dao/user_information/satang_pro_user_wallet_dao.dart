import 'package:flutter_satang_pro_exchange/dao/wallets/satang_pto_wallet_dao.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_currency.dart';

class SatangProUserWalletDao {
  List<SatangProWalletDao> list;

  SatangProUserWalletDao({this.list});

  factory SatangProUserWalletDao.fromJson(Map<String, dynamic> json) {
    List<SatangProWalletDao> list = List();
    for (String symbol in SatangProCurrency.LIST_CURRENCY_AVAILABLE) {
      if (json[symbol] != null) {
        list.add(SatangProWalletDao.fromJson(symbol, json[symbol]));
      }
    }

    return SatangProUserWalletDao(list: list);
  }

  List toJson() {
    return list.map((item) => item.toJson()).toList();
  }
}
