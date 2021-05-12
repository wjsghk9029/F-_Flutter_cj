import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/model/login.dart';
import 'package:oftable_flutter/page/login/model/renew_access_token.dart';
import 'package:oftable_flutter/page/login/utillity/login_page_util.dart';

class LoginService extends GetxService{
  static final tokenStorage = FlutterSecureStorage();
  var memberName =''.obs;
  var accessToken = ''.obs;
  var refreshToken = ''.obs;


  Future<void> doLogin(String id, String pw) async{
    if(id.isEmpty)
      throw Exception('아이디를 입력해주세요');
    if(pw.isEmpty)
      throw Exception('비밀번호를 입력해주세요');
    var jsonData = await LoginPageUtil.postLogin(id, pw);
    if(jsonData.statusCode != 200)
      throw Exception('${jsonData.statusCode} => Failed to Post Login');
    var data = Login.fromJson(jsonDecode(jsonData.body));
    if(data.error != 0)
      throw Exception('${jsonDecode(jsonData.body)['data']['msg']}');
    await _saveLoginData(data);
  }

  Future _saveLoginData(Login data) async {
    // ignore: unnecessary_statements
    await tokenStorage.containsKey(key: 'refresh_token') ? await tokenStorage.delete(key: 'refresh_token') : null;
    // ignore: unnecessary_statements
    await tokenStorage.containsKey(key: 'member_name') ? await tokenStorage.delete(key: 'member_name') : null;
    await tokenStorage.write(key: 'refresh_token', value: data.data.refresh_token);
    await tokenStorage.write(key: 'member_name', value: data.data.refresh_token);
    memberName(data.data.member_name);
    accessToken(data.data.access_token);
    refreshToken(data.data.refresh_token);
  }

  Future<void> renewAccessToken(String _refreshToken)  async {
    var jsonData = await LoginPageUtil.postRenewAccessToken(_refreshToken);
    if(jsonData.statusCode != 200)
      throw Exception('${jsonData.statusCode} => Failed to Post RenewAccessToken');
    var data = RenewAccessToken.fromJson(jsonDecode(jsonData.body));
    if(data.error != 0)
      throw Exception('${jsonDecode(jsonData.body)['data']['msg']}');
    accessToken(data.data.access_token);
  }

  Future<void> doLogout() async {
    await tokenStorage.delete(key: 'access_token');
    await tokenStorage.delete(key: 'refresh_token');
  }

  Future<void> readTokenFromStorage () async {
    if( !(await tokenStorage.containsKey(key: 'refresh_token')))
      throw Exception('there is no refresh_token');
    var _refreshToken = await tokenStorage.read(key: "refresh_token");
    refreshToken(_refreshToken);
  }
}