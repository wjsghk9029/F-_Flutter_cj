import 'package:flutter/material.dart';

import 'loginclass.dart';
class LoginTest extends StatefulWidget {
  final Login login;

  LoginTest(this.login);

  @override
  _LoginTestState createState() => _LoginTestState();
}

class _LoginTestState extends State<LoginTest> {
  Login _login;

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
    var apikey = _login.apikey;
    var error = _login.error;
    var type = _login.type;
    var accessToken = _login.data.access_token;
    var memberName = _login.data.member_name;
    var refreshToken = _login.data.refresh_token;
    return Column(
      children: [
        Text(apikey),
        Text('$error'),
        Text(type),
        Text(accessToken),
        Text(memberName),
        Text(refreshToken),
      ],
    );
  }


}
