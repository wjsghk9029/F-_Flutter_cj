import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/page/loginpage.dart';
import 'package:oftable_flutter/page/main/controller/bottom_navi_service.dart';
import 'package:oftable_flutter/page/main/main_page.dart';
import 'package:video_player/video_player.dart';

import 'LoginService.dart';

class RootPageController extends GetxController{
  LoginService _loginService = Get.put(LoginService());

  var videoController = VideoPlayerController.asset("assets/rootLoading.mp4").obs;
  var videoInitializeDone = false.obs;
  var isAutoLogin = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _autoLogin();
    var _vc = videoController.value;
    await _vc.initialize();
    _vc.setLooping(false);
    _vc.setVolume(0.0);
    _vc.play();
    videoInitializeDone(true);
    await Future.delayed(Duration(seconds: 2, milliseconds: 200));
    if(isAutoLogin.value){
      precacheImage(AssetImage('assets/background/레시피 하단 배경.jpg'), Get.context);
      Get.put(BottomNaviService());
      return Get.offAll(MainPage());
    }
    precacheImage(AssetImage('assets/Login_background.jpg'), Get.context);
    precacheImage(AssetImage('assets/logowithtext.png'), Get.context);
    Get.offAll(LoginPage());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    videoController.value.dispose();
  }

  Future<void> _autoLogin() async {
    try{
      await _loginService.readTokenFromStorage();
      await _loginService.renewAccessToken(_loginService.refreshToken.value);
      isAutoLogin(true);
    }catch(ex){
      isAutoLogin(false);
    }
  }
}
