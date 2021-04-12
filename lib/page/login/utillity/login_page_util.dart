import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oftable_flutter/page/login/model/loginclass.dart';

class LoginPageUtil {
  static Future<Login> postLogin(String id, String pw) async {
    final response = await http.post(
      Uri.http('210.93.86.79:8080', '/login'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: (<String, String>{
        'id': id,
        'pw': pw,
      }),
    );
    if (response.statusCode == 200) {
      return Login.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('${response.body}Failed to Post Login');
    }
  }

  static Future<RenewAccessToken> postRenewAccessToken(String refreshToken) async {
    final response = await http.post(
      Uri.http('210.93.86.79:8080', '/renew_access_token'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: (<String, String>{
        'refresh_token': refreshToken,
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return RenewAccessToken.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Post RenewAccessToken');
    }
  }
}