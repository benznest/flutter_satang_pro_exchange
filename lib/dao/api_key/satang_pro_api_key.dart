class SatangProApiKey {
  String apiKey;
  String secret;

  SatangProApiKey({this.apiKey = "", this.secret = ""}){
    apiKey = apiKey.trim();
    secret = secret.trim();
  }
}