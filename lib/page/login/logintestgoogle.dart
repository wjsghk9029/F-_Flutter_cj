import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        Text(idToken),
        Text(serverAuthCode),
      ],
    );
  }


}
