class SatangProUserLimitCurrencyItemDao {
  String currency;
  double available;
  double capacity;

  SatangProUserLimitCurrencyItemDao({this.currency, this.available, this.capacity});

  factory SatangProUserLimitCurrencyItemDao.fromJson(currency, Map<String, dynamic> json) {
    return SatangProUserLimitCurrencyItemDao(currency: currency,
      available: double.parse(json["available"].toString()), capacity: double.parse(json["capacity"].toString()),);
  }

  Map<String, dynamic> toJson() {
    return {"currency": this.currency, "available": this.available, "capacity": this.capacity,};
  }
}