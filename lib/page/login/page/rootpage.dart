import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/controller/LoginPageService.dart';
import 'package:oftable_flutter/page/main/main_page.dart';

import 'loginpage.dart';


class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  static final tokenStorage = FlutterSecureStorage();
  LoginPageService _loginPageService = Get.put(LoginPageService());

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
    if(accessToken != null && refreshToken != null){
      try{
        _loginPageService.doAutoLogin(refreshToken);
        Get.offAll(MainPage());
      }catch(ex){
        print(ex);
        Get.offAll(LoginPage());
      }
    }else{
      Get.offAll(LoginPage());
    }
  }
}

