import 'package:flutter_satang_pro_exchange/satang_pro_order_type.dart';

class SatangProUserOpenOrderItemDao {
  int id;
  double price;
  double amount;
  double remainingAmount;
  SatangProOrderType type;
  double cost;
  String createdAt;
  String status;

  SatangProUserOpenOrderItemDao({this.id, this.price, this.amount, this.remainingAmount, this.type, this.cost, this.createdAt, this.status});

  SatangProUserOpenOrderItemDao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = double.parse(json['price'].toString());
    amount = double.parse(json['amount'].toString());
    remainingAmount = double.parse(json['remaining_amount'].toString());
    type = fromStringToSatangProOrderType(json['side']);
    cost = double.parse(json['cost'].toString());
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['amount'] = this.amount;
    data['remaining_amount'] = this.remainingAmount;
    data['side'] = fromSatangProOrderTypeToString(type);
    data['cost'] = this.cost;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}
