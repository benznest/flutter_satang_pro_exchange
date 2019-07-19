import 'package:flutter_satang_pro_exchange/dao/user_information/identity/satang_pro_user_address_dao.dart';

class SatangProUserIdentityDao {
  int id;
  String firstNameEn;
  String lastNameEn;
  String firstNameTh;
  String lastNameTh;
  String birthDate;
  String nationality;
  String nationalIdentityNumber;
  String verificationImageUrl;
  String laserCode;
  String phoneNumber;
  SatangProUserAddressDao originAddress;
  SatangProUserAddressDao currentAddress;
  String sex;
  String occupation;
  int userId;
  String status;
  String createdAt;
  String updatedAt;
  bool fatcaUsCitizen;
  bool fatcaUsResident;
  String fatcaUsTin;

  SatangProUserIdentityDao(
      {this.id,
      this.firstNameEn,
      this.lastNameEn,
      this.firstNameTh,
      this.lastNameTh,
      this.birthDate,
      this.nationality,
      this.nationalIdentityNumber,
      this.verificationImageUrl,
      this.laserCode,
      this.phoneNumber,
      this.originAddress,
      this.currentAddress,
      this.sex,
      this.occupation,
      this.userId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.fatcaUsCitizen,
      this.fatcaUsResident,
      this.fatcaUsTin});

  SatangProUserIdentityDao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstNameEn = json['first_name_en'];
    lastNameEn = json['last_name_en'];
    firstNameTh = json['first_name_th'];
    lastNameTh = json['last_name_th'];
    birthDate = json['birth_date'];
    nationality = json['nationality'];
    nationalIdentityNumber = json['national_identity_number'];
    verificationImageUrl = json['verification_image_url'];
    laserCode = json['laser_code'];
    phoneNumber = json['phone_number'];
    originAddress = json['origin_address'] != null ? SatangProUserAddressDao.fromJson(json['origin_address']) : null;
    currentAddress = json['current_address'] != null ? SatangProUserAddressDao.fromJson(json['current_address']) : null;
    sex = json['sex'];
    occupation = json['occupation'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fatcaUsCitizen = json['fatca_us_citizen'];
    fatcaUsResident = json['fatca_us_resident'];
    fatcaUsTin = json['fatca_us_tin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name_en'] = this.firstNameEn;
    data['last_name_en'] = this.lastNameEn;
    data['first_name_th'] = this.firstNameTh;
    data['last_name_th'] = this.lastNameTh;
    data['birth_date'] = this.birthDate;
    data['nationality'] = this.nationality;
    data['national_identity_number'] = this.nationalIdentityNumber;
    data['verification_image_url'] = this.verificationImageUrl;
    data['laser_code'] = this.laserCode;
    data['phone_number'] = this.phoneNumber;
    if (this.originAddress != null) {
      data['origin_address'] = this.originAddress.toJson();
    }
    if (this.currentAddress != null) {
      data['current_address'] = this.currentAddress.toJson();
    }
    data['sex'] = this.sex;
    data['occupation'] = this.occupation;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['fatca_us_citizen'] = this.fatcaUsCitizen;
    data['fatca_us_resident'] = this.fatcaUsResident;
    data['fatca_us_tin'] = this.fatcaUsTin;
    return data;
  }
}
