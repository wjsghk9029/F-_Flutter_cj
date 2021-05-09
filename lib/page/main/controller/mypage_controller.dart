import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/controller/LoginPageService.dart';
import 'package:oftable_flutter/page/login/page/loginpage.dart';

class MyPageListItem{
  final String listText;
  final void Function() onTap;
  MyPageListItem(this.listText,{this.onTap});
}

class MyPageController extends GetxController{
  LoginPageService _loginPageService = Get.put(LoginPageService());

  RxList<MyPageListItem> shoppingItems = <MyPageListItem>[].obs;
  RxList<MyPageListItem> accountItems = <MyPageListItem>[].obs;
  RxList<MyPageListItem> serviceItems = <MyPageListItem>[].obs;


  @override
  void onInit() {
     super.onInit();
    shoppingItems.addAll([
      MyPageListItem('마이 TIP', onTap:(){}),
      MyPageListItem('마이 냉장고', onTap:(){}),
    ]);
    accountItems.addAll([
      MyPageListItem('회원정보 수정', onTap:(){}),
      MyPageListItem('알림 설정', onTap:(){}),
      MyPageListItem('로그아웃', onTap:_logout),
    ]);
    serviceItems.addAll([
      MyPageListItem('F# 고객센터', onTap:(){}),
    ]);
  }

  void _logout(){
    _loginPageService.doLogout();
    Get.reset();
    Get.offAll(LoginPage());
  }

}