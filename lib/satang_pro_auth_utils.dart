import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_satang_pro_exchange/dao/api_key/satang_pro_api_key.dart';
import 'package:flutter_satang_pro_exchange/satang_pro_utils.dart';

class SatangProAuthUtils {
  static Map<String, String> createHeader(SatangProApiKey key) {
    return {"Signature": "", "Authentication": "TDAX-API ${key.apiKey}"};
  }


  static Digest generateSignature(SatangProApiKey key, String payload) {
    String jsonPayload = jsonEncode(payload);

    var bytesApiKey = utf8.encode(key.secret);
    var bytesPayload = utf8.encode(jsonPayload);

    var hmacSha256 = Hmac(sha256, bytesApiKey); // HMAC-SHA256
    var digest = hmacSha256.convert(bytesPayload);

    return digest;
  }
}
