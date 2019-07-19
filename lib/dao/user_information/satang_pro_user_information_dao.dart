import 'package:flutter_satang_pro_exchange/dao/errors/satang_pro_error_dao.dart';
import 'package:flutter_satang_pro_exchange/dao/errors/satang_pro_response_error_support.dart';
import 'package:flutter_satang_pro_exchange/dao/user_information/satang_pro_user_limit_currency_dao.dart';
import 'package:flutter_satang_pro_exchange/dao/user_information/satang_pro_user_identity_dao.dart';
import 'package:flutter_satang_pro_exchange/dao/user_information/satang_pro_user_wallet_dao.dart';

class SatangProUserInformationDao extends SatangProResponseErrorSupport{
  int id;
  String email;
  String identityVerificationLevel;
  SatangProUserWalletDao wallets;
  SatangProUserLimitCurrencyDao limits;
  SatangProUserIdentityDao identity;


  SatangProUserInformationDao({this.id, this.email, this.identityVerificationLevel, this.wallets, this.limits, this.identity});


  SatangProUserInformationDao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    identityVerificationLevel = json['identity_verification_level'];
    wallets = json['wallets'] != null ? SatangProUserWalletDao.fromJson(json['wallets']) : null;
    limits = json['limits'] != null ? SatangProUserLimitCurrencyDao.fromJson(json['limits']) : null;
    identity = json['identity'] != null ? SatangProUserIdentityDao.fromJson(json['identity']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['identity_verification_level'] = this.identityVerificationLevel;
    if (this.wallets != null) {
      data['wallets'] = this.wallets.toJson();
    }
    if (this.limits != null) {
      data['limits'] = this.limits.toJson();
    }
    if (this.identity != null) {
      data['identity'] = this.identity.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    return data;
  }
}
