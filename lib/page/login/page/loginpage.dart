import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/login/controller/LoginPageService.dart';
import 'package:oftable_flutter/page/main/main_page.dart';
import 'package:oftable_flutter/page/register/start_oftable_page.dart';

import '../logintestgoogle.dart';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageService _loginPageService = Get.put(LoginPageService());
  final idTextFieldController = TextEditingController();
  final pwTextFieldController = TextEditingController();
  final googleSignIn = GoogleSignIn();
  bool keyboardOpen = false;

  @override
  void initState() {
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() => keyboardOpen = visible);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    idTextFieldController.dispose();
    pwTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('나가고 싶다면 한번 더 누르시오'),
          ),
            child: _buildBody()
        ),
      ),
    );
  }

 Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: Get.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.all(Get.height*0.025),),
            LimitedBox(
              maxHeight: Get.height*0.45,
              child:Container(
                child: _logoPart(),
              ),
            ),
            Padding(padding: EdgeInsets.all(Get.height*0.05),),
            LimitedBox(
              maxHeight: Get.height*0.35,
              child:Container(
                child: _loginPart(),
              ),
            ),
            Padding(padding: EdgeInsets.all(Get.height*0.025),),
          ],
        ),
      ),
    );
  }

  Widget _logoPart() {
    return Column(
      children: [
        Image.asset('assets/logo_white.png',
        height: Get.height * 0.3,),
        Container(
          padding: EdgeInsets.only(top: Get.height*0.02),
          child: MaterialButton(
            onPressed: () => Get.to(StartOfTablePage()),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                child: Text('시작하기',
                  style: TextStyle(
                      fontFamily: 'NanumGothic',
                      fontSize: Get.height*0.08,
                      color: ColorsUtil.indiaCurryYellow,
                      fontWeight: FontWeight.w800
                  ),
                )
            ),
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _loginPart(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('LOG IN', style: TextStyle(fontFamily: 'Poppins', fontSize: Get.height * 0.025),),
        Container(
          width: Get.width * 0.5,
          height: Get.height * 0.05,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 5
              )
            ),
          ),
          child: TextField(
            style: TextStyle(
              fontFamily: 'NanumGothic',
              fontSize: Get.height * 0.02,
            ),
            controller: idTextFieldController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontFamily: 'NanumGothic',
                  color: Colors.grey,
              ),
              hintText: '아이디',
              border: InputBorder.none,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(Get.height * 0.01)),
        Container(
          width: Get.width * 0.5,
          height: Get.height * 0.05,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 5)),),
          child: TextField(
            style: TextStyle(
              fontFamily: 'NanumGothic',
              fontSize: Get.height * 0.02,
            ),
            controller: pwTextFieldController,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontFamily: 'NanumGothic',
                color: Colors.grey,
              ),
              hintText: '비밀번호',
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: Get.height*0.001, bottom: Get.height*0.001),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: MaterialButton(
              minWidth: Get.width* 0.3,
              height: Get.height * 0.05,
              onPressed: _onpressLoginButton,
              child: Container(
                  child: Text('로그인 하기',
                    style: TextStyle(
                        fontFamily: 'NanumGothic',
                        fontSize: Get.height * 0.025,
                        color: Colors.white,
                    ),
                  )
              ),
              color: Colors.black,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: Get.height*0.01),
          alignment: Alignment.centerLeft,
          child: _findUser(Get.height * 0.02),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(margin: EdgeInsets.only(right: 10),color: Colors.blueAccent,child: IconButton(onPressed: () async {
              var data = await _signInWithGoogle();
              Get.to(GoogleLoginTest(data));
            }, color: Colors.white, icon: Icon(Icons.add))),
            Container(margin: EdgeInsets.only(right: 10),color: Colors.blueAccent,child: IconButton(onPressed: (){}, color: Colors.white, icon: Icon(Icons.add))),
            Container(margin: EdgeInsets.only(right: 10),color: Colors.blueAccent,child: IconButton(onPressed: (){}, color: Colors.white, icon: Icon(Icons.add))),
            Container(margin: EdgeInsets.only(right: 10),color: Colors.blueAccent,child: IconButton(onPressed: (){}, color: Colors.white, icon: Icon(Icons.add))),
          ],
        ),
      ],
    );
  }

  Row _findUser(double _fontSize) {
    return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(child: Text('아이디 찾기', style: TextStyle(fontSize: _fontSize), ), onTap: (){}),
            Container(child: Text(' / ', style: TextStyle(fontSize: _fontSize),)),
            GestureDetector(child: Text('비밀번호 찾기', style: TextStyle(fontSize: _fontSize),), onTap: (){}),
          ],
        );
  }

  Future<GoogleSignInAuthentication> _signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;
    return googleAuth;
  }

  Future<void> _onpressLoginButton() async {
    try{
      await _loginPageService.doLogin(idTextFieldController.text, pwTextFieldController.text);
      Get.offAll(MainPage());
    }
    catch(ex) {
      Get.defaultDialog(title: '에러', middleText: ex.toString());
    }
  }


}
