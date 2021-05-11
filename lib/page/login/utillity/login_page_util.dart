import 'package:http/http.dart' as http;

class LoginPageUtil {
  static Future<http.Response> postLogin(String id, String pw) async {
    return http.post(
      Uri.http('210.93.86.79:8080', '/login'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: (<String, String>{
        'id': id,
        'pw': pw,
      }),
    );
  }

  static Future<http.Response> postRenewAccessToken(String refreshToken) async {
    return await http.post(
      Uri.http('210.93.86.79:8080', '/renew_access_token'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: (<String, String>{
        'refresh_token': refreshToken,
      }),
    );
  }
}