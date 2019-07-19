import 'package:flutter_satang_pro_exchange/dao/user_information/satang_pro_user_limit_currency_item_dao.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_currency_manager.dart';

class SatangProUserLimitCurrencyDao {
  List<SatangProUserLimitCurrencyItemDao> listUserLimitCurrencyItem;

  SatangProUserLimitCurrencyDao({this.listUserLimitCurrencyItem});

  factory SatangProUserLimitCurrencyDao.fromJson(Map<String, dynamic> json) {
    List<SatangProUserLimitCurrencyItemDao> list = List();
    for (String symbol in SatangProCurrencyManager.LIST_CURRENCY_AVAILABLE) {
      list.add(SatangProUserLimitCurrencyItemDao.fromJson(symbol, json[symbol]));
    }
    return SatangProUserLimitCurrencyDao(listUserLimitCurrencyItem: list);
  }

  List toJson() {
    return this.listUserLimitCurrencyItem.map((item) => item.toJson()).toList();
  }
}
