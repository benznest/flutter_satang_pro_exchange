enum SatangProOrderType { BUY, SELL }

fromSatangProOrderTypeToString(SatangProOrderType orderType) {
  if (orderType == SatangProOrderType.BUY) {
    return "buy";
  }
  return "sell";
}

fromStringToSatangProOrderType(String orderType) {
  orderType = orderType.toLowerCase().trim();
  if (orderType == "buy") {
    return SatangProOrderType.BUY;
  }
  return SatangProOrderType.SELL;
}
