
import 'package:flutter_satang_pro_exchange/dao/errors/satang_pro_response_error_support.dart';
import 'package:flutter_satang_pro_exchange/dao/user_open_orders/satang_pro_user_open_order_item_dao.dart';

class SatangProUserOpenOrderDao extends SatangProResponseErrorSupport {
  List<SatangProUserOpenOrderItemDao> orders;

  SatangProUserOpenOrderDao({this.orders});

  factory SatangProUserOpenOrderDao.fromJson(List list) {
    return SatangProUserOpenOrderDao(
      orders: List.of(list.map((item) => SatangProUserOpenOrderItemDao.fromJson(item)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "orders": (this.orders.map((item) => item.toJson())).toList(),
    };
  }
}
