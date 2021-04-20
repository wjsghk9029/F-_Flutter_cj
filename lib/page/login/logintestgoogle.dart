import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:oftable_flutter/page/login/page/loginpage.dart';

class GoogleLoginTest extends StatefulWidget {
  final GoogleSignInAuthentication login;

  GoogleLoginTest(this.login);

  @override
  _GoogleLoginTestState createState() => _GoogleLoginTestState();
}

class _GoogleLoginTestState extends State<GoogleLoginTest> {
  GoogleSignInAuthentication _login;
  final ipTextFieldController = TextEditingController();

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

  Widget _test() {
    var accessToken = _login.accessToken;
    var idToken = _login.idToken;
    var serverAuthCode = _login.serverAuthCode;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('accessToken'),
          Text(accessToken),
          Padding(padding: EdgeInsets.all(10)),
          Text('idToken'),
          Text(idToken),
          Padding(padding: EdgeInsets.all(10)),
          Text(serverAuthCode ?? 'serverAuthCode : 없음'),
          Container(
            width: Get.width,
            height: Get.height * 0.1,
            decoration: BoxDecoration(
                border: Border.all(width: 5)),
            child: TextField(
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: Get.height * 0.05,
              ),
              controller: ipTextFieldController,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontFamily: 'NanumGothic',
                  color: Colors.grey,
                ),
                hintText: 'ip번호',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            child: MaterialButton(
                onPressed: _doLogin,
              child: Text('토큰보내기'),
            ),
            color: Colors.yellowAccent,
            width: 100,
            height: 100,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: MaterialButton(onPressed: () async {
              await GoogleSignIn().signOut();
              Get.offAll(LoginPage());
            },
            child: Text('로그아웃'),),
            color: Colors.yellowAccent,
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }



  Future<void> _doLogin() async {
    print(widget.login.idToken);
    var response = await http.post(
      Uri.http('${ipTextFieldController.text}:8080', '/google_login'),
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
