class SatangProUserDistrictDao {
  int id;
  int code;
  String nameInThai;
  String nameInEnglish;

  SatangProUserDistrictDao({this.id, this.code, this.nameInThai, this.nameInEnglish});

  SatangProUserDistrictDao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nameInThai = json['name_in_thai'];
    nameInEnglish = json['name_in_english'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name_in_thai'] = this.nameInThai;
    data['name_in_english'] = this.nameInEnglish;
    return data;
  }
}