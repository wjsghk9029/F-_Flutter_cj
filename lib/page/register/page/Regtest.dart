import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/login/loginclass.dart';
class Regtest extends StatefulWidget {
  final Login login;

  Regtest(this.login);

  @override
  _RegtestState createState() => _RegtestState();
}

class _RegtestState extends State<Regtest> {
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
    var refreshToken = _login.data.refresh_token;
    return Column(
      children: [
        Text(apikey),
        Text('$error'),
        Text(type),
        Text(accessToken),
        Text(refreshToken),
      ],
    );
  }


}
