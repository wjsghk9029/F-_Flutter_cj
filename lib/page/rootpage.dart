import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auto_login_test.dart';
import 'login/page/loginpage.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  static final tokenStorage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return _buildBody(context);
          }
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/ic_launcher.png',
            fit: BoxFit.fill,
            height:80,
            width: 80,
          ),
          Text('title', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

  Future<void> _asyncMethod() async {
    var accessToken = await tokenStorage.read(key: "access_token");
    var refreshToken = await tokenStorage.read(key: "refresh_token");
    var isAutoLogin = await tokenStorage.read(key: "isAutoLogin");
    if(accessToken != null && refreshToken != null && isAutoLogin != null && isAutoLogin == 'true'){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AutoLoginTest(acT: accessToken, rFT: refreshToken,)));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    }
  }

}

