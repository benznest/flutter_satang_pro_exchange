class SatangProErrorDao{
  String code;
  String message;

  SatangProErrorDao({this.code, this.message});

  factory SatangProErrorDao.fromJson(Map<String, dynamic> json) {
    return SatangProErrorDao(code: json["Code"], message: json["Message"],);
  }

  Map<String, dynamic> toJson() {
    return {"Code": this.code, "Message": this.message};
  }

}