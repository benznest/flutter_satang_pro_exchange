class SatangProWalletDao {
  String currency;
  List<String> addresses;
  double availableBalance;

  SatangProWalletDao({this.currency, this.addresses, this.availableBalance});

  factory SatangProWalletDao.fromJson(String currency, Map<String, dynamic> json) {

    List listAddress = json["addresses"] ?? List();

    return SatangProWalletDao(
      currency: currency,
      addresses: listAddress.map((i) => i.toString()).toList() ?? List(),
      availableBalance: double.parse((json["available_balance"] ?? 0 ).toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "currency":currency,
      "addresses": (this.addresses.map((item) => item).toList()),
      "availableBalance": this.availableBalance,
    };
  }
}
