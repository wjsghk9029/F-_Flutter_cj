import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/utillity/login_page_util.dart';

class LoginPageService extends GetxService{
  static final tokenStorage = FlutterSecureStorage();
  var memberName =''.obs;
  var accessToken = ''.obs;
  var refreshToken = ''.obs;


  Future<void> doLogin(String id, String pw) async{
    try {
      var data = await LoginPageUtil.postLogin(id, pw);
      // ignore: unnecessary_statements
      await tokenStorage.containsKey(key: 'refresh_token') ? await tokenStorage.delete(key: 'refresh_token') : null;
      // ignore: unnecessary_statements
      await tokenStorage.containsKey(key: 'member_name') ? await tokenStorage.delete(key: 'member_name') : null;
      await tokenStorage.write(key: 'refresh_token', value: data.data.refresh_token);
      await tokenStorage.write(key: 'member_name', value: data.data.refresh_token);
      memberName(data.data.member_name);
      accessToken(data.data.access_token);
      refreshToken(data.data.refresh_token);
    }catch(err){
      throw(err);
    }
  }

  Future<void> renewAccessToken(String _refreshToken)  async {
    try {
      var data = await LoginPageUtil.postRenewAccessToken(_refreshToken);
      accessToken(data.data.access_token);
    }catch(err){
      throw(err);
    }
  }

  Future<void> doLogout() async {
    await tokenStorage.delete(key: 'access_token');
    await tokenStorage.delete(key: 'refresh_token');
  }

  Future<void> readTokenFromStorage () async {
    if( !(await tokenStorage.containsKey(key: 'refresh_token')))
      throw('there is no refresh_token');
    var _refreshToken = await tokenStorage.read(key: "refresh_token");
    refreshToken(_refreshToken);
  }
}