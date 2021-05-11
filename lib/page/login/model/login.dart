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
      access_token: json['access_token']as String,
      refresh_token: json['refresh_token']as String,
    );
  }
}
//#endregion
