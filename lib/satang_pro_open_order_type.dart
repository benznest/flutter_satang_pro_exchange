enum SatangProOpenOrderType { BIDS, ASKS }

String fromSatangProOpenOrderTypeToString(SatangProOpenOrderType type){
  return type == SatangProOpenOrderType.BIDS ? "BIDS" : "ASKS";
}