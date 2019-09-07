class SatangProCurrencyPairDao {
  /// example pair BTC_THB.
  /// the primary currency is THB
  /// the secondary currency is BTC
  ///
  String primaryCurrency;
  String secondaryCurrency;

  SatangProCurrencyPairDao({this.primaryCurrency, this.secondaryCurrency});

  Map<String, dynamic> toJson() {
    return {
      "primaryCurrency": this.primaryCurrency,
      "secondaryCurrency": this.secondaryCurrency,
    };
  }


}
