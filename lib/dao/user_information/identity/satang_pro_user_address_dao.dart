import 'package:flutter_satang_pro_exchange/dao/user_information/identity/satang_pro_user_district_dao.dart';
import 'package:flutter_satang_pro_exchange/dao/user_information/identity/satang_pro_user_province_dao.dart';
import 'package:flutter_satang_pro_exchange/dao/user_information/identity/satang_pro_user_sub_district_dao.dart';

class SatangProUserAddressDao {
  String address;
  SatangProUserProvinceDao province;
  SatangProUserDistrictDao district;
  SatangProUserSubDistrictDao subDistrict;

  SatangProUserAddressDao({this.address, this.province, this.district, this.subDistrict});

  SatangProUserAddressDao.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    province = json['province'] != null ?  SatangProUserProvinceDao.fromJson(json['province']) : null;
    district = json['district'] != null ?  SatangProUserDistrictDao.fromJson(json['district']) : null;
    subDistrict = json['sub_district'] != null ?  SatangProUserSubDistrictDao.fromJson(json['sub_district']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    if (this.province != null) {
      data['province'] = this.province.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district.toJson();
    }
    if (this.subDistrict != null) {
      data['sub_district'] = this.subDistrict.toJson();
    }
    return data;
  }
}
