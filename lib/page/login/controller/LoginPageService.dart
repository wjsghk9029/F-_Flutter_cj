import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/utillity/login_page_util.dart';

class LoginPageService extends GetxService{
  static final tokenStorage = FlutterSecureStorage();
  var memberName =''.obs;
  var accessToken = ''.obs;
  var refreshToken = ''.obs;

  void doLogin(bool isAutoLogin, String id, String pw) async{
    try {
      var data = await LoginPageUtil.postLogin(id, pw);
      if(isAutoLogin){
        await tokenStorage.write(key: 'access_token', value: data.data.access_token);
        await tokenStorage.write(key: 'refresh_token', value: data.data.refresh_token);
      }
      memberName(data.data.member_name);
      accessToken(data.data.access_token);
      refreshToken(data.data.refresh_token);
    }catch(err){
      throw(err);
    }
  }

}