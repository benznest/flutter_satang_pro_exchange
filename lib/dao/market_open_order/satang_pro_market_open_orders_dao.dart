import 'package:flutter_satang_pro_exchange/dao/market_open_order/satang_pro_open_order_item_dao.dart';

class SatangProMarketOpenOrdersDao {
  List<SatangProOpenOrderItemDao> bids;
  List<SatangProOpenOrderItemDao> asks;

  SatangProMarketOpenOrdersDao({this.bids, this.asks});

  factory SatangProMarketOpenOrdersDao.fromJson(Map<String, dynamic> json) {
    List listBid = json["bid"];
    List listAsk = json["ask"];

    return SatangProMarketOpenOrdersDao(
      bids: listBid.map((json) => SatangProOpenOrderItemDao.fromJson(json)).toList(),
      asks: listAsk.map((json) => SatangProOpenOrderItemDao.fromJson(json)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {"bid": bids.map((item) => item.toJson()).toList(), "ask": asks.map((item) => item.toJson()).toList()};
  }
}
