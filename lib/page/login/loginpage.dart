import 'dart:convert';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:oftable_flutter/page/login/loginclass.dart';
import 'package:oftable_flutter/page/login/widget/auto_login_checkbox.dart';
import 'package:oftable_flutter/page/main/main_page.dart';
import 'package:oftable_flutter/page/register/start_oftable_page.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

import 'package:http/http.dart' as http;

import 'logintest.dart';
import 'logintestgoogle.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final tokenStorage = FlutterSecureStorage();
  final idTextFieldController = TextEditingController();
  final pwTextFieldController = TextEditingController();
  final googleSignIn = GoogleSignIn(clientId: '582691238041-sqa3ohlnqm6edfroj2dtr98b3ghov0jn.apps.googleusercontent.com',
  scopes: ['email', 'profile']);
  bool _autoLoginCheckbox = false;
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLoginTextField(),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                child: AutoLoginCheckBox(
                  onPressed: (){
                    setState(() {
                      _autoLoginCheckbox = !_autoLoginCheckbox;
                      if(_autoLoginCheckbox){
                        tokenStorage.write(key: 'isAutoLogin', value: 'true');
                      }else{
                        tokenStorage.write(key: 'isAutoLogin', value: 'false');
                      }
                    });
                  },
                  isChecked: _autoLoginCheckbox,
                ),
              ),
            ],
          ),
        ),
        keyboardOpen ?
            Container()
            : _onNotKeyBoardOpen(),
      ],
    );
  }

  Container _onNotKeyBoardOpen() {
    return Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 100)),
            MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => StartOfTablePage()));
              },
              child: Text('회원가입', style: TextStyle(fontSize: 20),),
              color: Colors.white54,
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: MaterialButton(
                onPressed: _onpressLoginButton,
                child: Text('로그인', style: TextStyle(fontSize: 20),),
                color: Colors.white54,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                },
                child: Text('홈페이지 테스트', style: TextStyle(fontSize: 20),),
                color: Colors.white54,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(child: Text('아이디 찾기', style: TextStyle(fontSize: 13),), onPressed: (){}),
                CupertinoButton(child: Text('비밀번호 찾기', style: TextStyle(fontSize: 13),), onPressed: (){}),
              ],
            ),
            SignInButton(
                buttonType: ButtonType.google,
                onPressed: (){signInWithGoogle().then((value) =>  Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleLoginTest(value))));},
            ),
          ],
        ),
      );
  }

  _buildLoginTextField() {
    return Container(
      width: 200,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: idTextFieldController,
              decoration: InputDecoration(
                hintText: '아이디',
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: pwTextFieldController,
              decoration: InputDecoration(
                hintText: '비밀번호',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _onpressLoginButton() async{
    try {
      var data = await _doLogin();
      if(_autoLoginCheckbox){
        await tokenStorage.write(key: 'access_token', value: data.data.access_token);
        await tokenStorage.write(key: 'refresh_token', value: data.data.refresh_token);
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginTest(data)));
    }catch(err){
    }

  }

  Future<Login> _doLogin() async {
    final response = await http.post(
      Uri.http('61.81.99.55:8080', '/login'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: (<String, String>{
        'id': idTextFieldController.text,
        'pw': pwTextFieldController.text,
      }),
    );
    if (response.statusCode == 200) {
      return Login.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<GoogleSignInAuthentication> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    print('test');
    final googleAuth = await googleUser.authentication;
    return googleAuth;
  }
}
