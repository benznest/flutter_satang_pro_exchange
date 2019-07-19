import 'package:flutter_satang_pro_exchange/dao/user_information/satang_pro_user_limit_currency_item_dao.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_currency.dart';

class SatangProUserLimitCurrencyDao {
  List<SatangProUserLimitCurrencyItemDao> list;

  SatangProUserLimitCurrencyDao({this.list});

  factory SatangProUserLimitCurrencyDao.fromJson(Map<String, dynamic> json) {
    List<SatangProUserLimitCurrencyItemDao> list = List();
    for (String symbol in SatangProCurrency.LIST_CURRENCY_AVAILABLE) {
      list.add(SatangProUserLimitCurrencyItemDao.fromJson(symbol, json[symbol]));
    }
    return SatangProUserLimitCurrencyDao(list: list);
  }

  List toJson() {
    return this.list.map((item) => item.toJson()).toList();
  }
}
