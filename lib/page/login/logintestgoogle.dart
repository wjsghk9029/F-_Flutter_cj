import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleLoginTest extends StatefulWidget {
  final GoogleSignInAuthentication login;

  GoogleLoginTest(this.login);

  @override
  _GoogleLoginTestState createState() => _GoogleLoginTestState();
}

class _GoogleLoginTestState extends State<GoogleLoginTest> {
  GoogleSignInAuthentication _login;

  @override
  void initState() {
    _login = widget.login;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),

    );
  }

  _buildBody() {
    return Container(
      child: _test(),
    );
  }

  Column _test() {
    var accessToken = _login.accessToken;
    var idToken = _login.idToken;
    var serverAuthCode = _login.serverAuthCode;
    return Column(
      children: [
        Text(accessToken),
        Padding(padding: EdgeInsets.all(10)),
        Text(idToken),
        Padding(padding: EdgeInsets.all(10)),
        Text(serverAuthCode ?? '없음'),
        Container(
          child: MaterialButton(onPressed: _doLogin),
          color: Colors.yellowAccent,
          width: 100,
          height: 100,
        ),
      ],
    );
  }



  Future<void> _doLogin() async {
    print(widget.login.idToken);
    final response = await http.post(
      Uri.http('172.16.36.142:8080', '/google_login'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: (<String, String>{
        'client_id': widget.login.idToken,
        'token': widget.login.accessToken,
      }),
    );
    print(response.body);
    print(response.headers);
    if (response.statusCode == 200) {
      return Get.defaultDialog(title: '성공', middleText: response.body);
    } else {
      Get.defaultDialog(title: '실패', middleText: response.body);
    }
  }

}
