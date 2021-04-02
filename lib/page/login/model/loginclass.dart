//#region Login
class Login {
  final String apikey;
  final int error;
  final String type;
  final LoginData data;

  Login({this.apikey, this.error, this.type, this.data});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      apikey: json['apikey']as String,
      error: json['error']as int,
      type: json['type']as String,
      data: LoginData.fromJson(json['data']),
    );
  }
}

class LoginData {
  // ignore: non_constant_identifier_names
  final String member_name;
  // ignore: non_constant_identifier_names
  final String access_token;
  // ignore: non_constant_identifier_names
  final String refresh_token;

  // ignore: non_constant_identifier_names
  LoginData({this.member_name, this.access_token, this.refresh_token});


  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      member_name: json['member_name']as String,
      access_token: json['access_token']as String,
      refresh_token: json['refresh_token']as String,
    );
  }
}
//#endregion
//#region RenewAccessToken
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
//#endregion
