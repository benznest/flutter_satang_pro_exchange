class SatangProOpenOrderItemDao{
  double price;
  double amount;

  SatangProOpenOrderItemDao({this.price, this.amount});

  factory SatangProOpenOrderItemDao.fromJson(Map<String, dynamic> json) {
    return SatangProOpenOrderItemDao(price: double.parse(json["price"]), amount: double.parse(json["amount"]),);
  }

  Map<String, dynamic> toJson() {
    return {"price": this.price, "amount": this.amount};
  }

}