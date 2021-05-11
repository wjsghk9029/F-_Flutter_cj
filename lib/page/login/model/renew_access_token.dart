class RenewAccessToken {
  final String apikey;
  final int error;
  final String type;
  final RenewAccessTokenData data;

  RenewAccessToken({this.apikey, this.error, this.type, this.data});

  factory RenewAccessToken.fromJson(Map<String, dynamic> json) {
    return RenewAccessToken(
      apikey: json['apikey']as String,
      error: json['error']as int,
      type: json['type']as String,
      data: RenewAccessTokenData.fromJson(json['data']),
    );
  }
}

class RenewAccessTokenData {
  // ignore: non_constant_identifier_names
  final String access_token;

  // ignore: non_constant_identifier_names
  RenewAccessTokenData({this.access_token});


  factory RenewAccessTokenData.fromJson(Map<String, dynamic> json) {
    return RenewAccessTokenData(
      access_token: json['access_token']as String,
    );
  }
}