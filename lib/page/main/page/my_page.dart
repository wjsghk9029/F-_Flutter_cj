import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/controller/LoginPageService.dart';
import 'package:oftable_flutter/page/login/page/loginpage.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  LoginPageService _loginPageService = Get.put(LoginPageService());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoButton(child: Text('로그아웃'),onPressed: (){
        _loginPageService.doLogout();
        Get.offAll(LoginPage());
      },),
    );
  }
}
