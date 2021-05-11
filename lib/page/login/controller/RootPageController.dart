 import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/page/loginpage.dart';
import 'package:oftable_flutter/page/main/main_page.dart';
import 'package:video_player/video_player.dart';

import 'LoginPageService.dart';

class RootPageController extends GetxController{
  LoginPageService _loginPageService = Get.put(LoginPageService());

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
    if(isAutoLogin.value)
      return Get.offAll(MainPage());
    Get.offAll(LoginPage());
  }


  @override
  void onClose() {
    super.onClose();
    videoController.value.dispose();
  }


  Future<void> _autoLogin() async {
    try{
      await _loginPageService.readTokenFromStorage();
      await _loginPageService.renewAccessToken(_loginPageService.refreshToken.value);
      isAutoLogin(true);
    }catch(ex){
      isAutoLogin(false);
    }
  }
}
