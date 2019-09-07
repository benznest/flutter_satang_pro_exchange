import 'package:flutter_satang_pro_exchange/dao/satang_pro_currency_pair_dao.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_currency_pair.dart';

class SatangProMarketCapCurrencyDao {
  SatangProCurrencyPairDao currencyPair;
  double avg24hr;
  double baseVolume;
  double high24hr;
  double highestBid;
  double last;
  double low24hr;
  double lowestAsk;
  double percentChange;
  double quoteVolume;

  SatangProMarketCapCurrencyDao(
      {this.avg24hr,
      this.baseVolume,
      this.high24hr,
      this.highestBid,
      this.last,
      this.low24hr,
      this.lowestAsk,
      this.percentChange,
      this.quoteVolume});

  static List<SatangProMarketCapCurrencyDao> fromListJson(
      Map<String, dynamic> json) {
    List<SatangProMarketCapCurrencyDao> list = List();
    SatangProCurrencyPair.CURRENCY_PAIR_SUPPORT.forEach((key, pair) {
      list.add(SatangProMarketCapCurrencyDao.fromJson(pair, json[key]));
    });
    return list;
  }

  SatangProMarketCapCurrencyDao.fromJson(
      SatangProCurrencyPairDao currencyPair, Map<String, dynamic> json) {
    this.currencyPair = currencyPair;
    avg24hr = double.parse(json['avg24hr'].toString());
    baseVolume = double.parse(json['baseVolume'].toString());
    high24hr = double.parse(json['high24hr'].toString());
    highestBid = double.parse(json['highestBid'].toString());
    last = double.parse(json['last'].toString());
    low24hr = double.parse(json['low24hr'].toString());
    lowestAsk = double.parse(json['lowestAsk'].toString());
    percentChange = double.parse(json['percentChange'].toString());
    quoteVolume = double.parse(json['quoteVolume'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currencyPair'] = this.currencyPair.toJson();
    data['avg24hr'] = this.avg24hr;
    data['baseVolume'] = this.baseVolume;
    data['high24hr'] = this.high24hr;
    data['highestBid'] = this.highestBid;
    data['last'] = this.last;
    data['low24hr'] = this.low24hr;
    data['lowestAsk'] = this.lowestAsk;
    data['percentChange'] = this.percentChange;
    data['quoteVolume'] = this.quoteVolume;
    return data;
  }
}
