class SatangProApiKey {
  String apiKey;
  String secret;

  SatangProApiKey({this.apiKey = "", this.secret = ""}) {
    apiKey = apiKey.trim();
    secret = secret.trim();
  }

  bool get available => apiKey != null && secret != null && apiKey.isNotEmpty && secret.isNotEmpty;
}
