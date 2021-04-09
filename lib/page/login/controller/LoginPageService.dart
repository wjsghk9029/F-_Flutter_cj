import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/utillity/login_page_util.dart';

class LoginPageService extends GetxService{
  static final tokenStorage = FlutterSecureStorage();
  var memberName =''.obs;
  var accessToken = ''.obs;
  var refreshToken = ''.obs;

  void doLogin(String id, String pw) async{
    try {
      var data = await LoginPageUtil.postLogin(id, pw);
      await tokenStorage.containsKey(key: 'access_token') ? tokenStorage.delete(key: 'access_token') : null;
      await tokenStorage.containsKey(key: 'refresh_token') ? tokenStorage.delete(key: 'refresh_token') : null;
      await tokenStorage.write(key: 'access_token', value: data.data.access_token);
      await tokenStorage.write(key: 'refresh_token', value: data.data.refresh_token);
      memberName(data.data.member_name);
      accessToken(data.data.access_token);
      refreshToken(data.data.refresh_token);
    }catch(err){
      throw(err);
    }
  }

  Future<void> doAutoLogin(String _refreshToken) async {
    try {
      var data = await LoginPageUtil.postRenewAccessToken(_refreshToken);
      accessToken(data.data.access_token);
      refreshToken(_refreshToken);
      print('at = $accessToken');
      print('rt = $refreshToken');
    }catch(err){
      throw(err);
    }
  }

  Future<void> doLogout() async {
    await tokenStorage.delete(key: 'access_token');
    await tokenStorage.delete(key: 'refresh_token');
    Get.reset();
  }
}