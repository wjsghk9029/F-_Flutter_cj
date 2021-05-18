import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/bottom_navi_service.dart';
import 'package:oftable_flutter/page/main/main_page.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';

import 'LoginService.dart';

class LoginPageController extends GetxController{
  LoginService _loginService = Get.put(LoginService());

  final idTextFieldController = TextEditingController();
  final pwTextFieldController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    idTextFieldController.dispose();
    pwTextFieldController.dispose();
  }

  Future<void> onPressLoginButton() async {
    try{
      await _loginService.doLogin(idTextFieldController.text, pwTextFieldController.text);
      Register().reset();
      precacheImage(AssetImage('assets/background/레시피 하단 배경.jpg'), Get.context);
      Get.put(BottomNaviService());
      Get.offAll(MainPage());
    }
    catch(ex) {
      Get.defaultDialog(title: '에러', middleText: ex.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
    precacheImage( AssetImage('assets/register_background.jpg'), Get.context);
  }
}