import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_satang_pro_exchange/dao/api_key/satang_pro_api_key.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/digests/sha512.dart';
import 'package:pointycastle/macs/hmac.dart';

class SatangProAuthUtils {
  static Map<String, String> createHeader({String signature, SatangProApiKey key}) {
    return {"Signature": "$signature", "Authentication": "TDAX-API ${key.apiKey}"};
  }

  static Uint8List hmacSHA512(Uint8List key, Uint8List data) {
    final _tmp = HMac(SHA512Digest(), 128)..init(KeyParameter(key));
    return _tmp.process(data);
  }

  static String formatBytesAsHexString(Uint8List bytes) {
    var result = StringBuffer();
    for (var i = 0; i < bytes.length; i++) {
      var part = bytes[i];
      result.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
    }
    return result.toString();
  }

  static Uint8List createUint8ListFromString(String s) {
    var ret = Uint8List(s.length);
    for (var i = 0; i < s.length; i++) {
      ret[i] = s.codeUnitAt(i);
    }
    return ret;
  }

  static String generateSignature(SatangProApiKey key, String payload) {
    Uint8List message = createUint8ListFromString("$payload");
    Uint8List keySigning = createUint8ListFromString("${key.secret}");
    return formatBytesAsHexString(hmacSHA512( message,keySigning));
  }
}
