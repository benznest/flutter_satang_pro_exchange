import 'package:flutter_satang_pro_exchange/dao/satang_pro_currency_pair_dao.dart';

class SatangProCurrencyPair {
  static Map<String, SatangProCurrencyPairDao> CURRENCY_PAIR_SUPPORT = {
    "BTC_THB": SatangProCurrencyPairDao(
        primaryCurrency: "THB", secondaryCurrency: "BTC"),
    "ETH_THB": SatangProCurrencyPairDao(
        primaryCurrency: "THB", secondaryCurrency: "ETH"),
    "JFIN_THB": SatangProCurrencyPairDao(
        primaryCurrency: "THB", secondaryCurrency: "JFIN"),
    "USDT_THB": SatangProCurrencyPairDao(
        primaryCurrency: "THB", secondaryCurrency: "USDT"),
    "XLM_THB": SatangProCurrencyPairDao(
        primaryCurrency: "THB", secondaryCurrency: "XLM"),
    "XRP_THB": SatangProCurrencyPairDao(
        primaryCurrency: "THB", secondaryCurrency: "XRP"),
    "XZC_THB": SatangProCurrencyPairDao(
        primaryCurrency: "THB", secondaryCurrency: "XZC"),
  };
}
