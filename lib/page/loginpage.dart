import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:oftable_flutter/page/start_oftable/page/start_oftable_page.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class LoginPage extends StatefulWidget {
  final idTextFieldController = TextEditingController();
  final pwTextFieldController = TextEditingController();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


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
    widget.idTextFieldController.dispose();
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
            children: [
              Text('로그인'),
              _buildLoginTextField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(child: Text('자동로그인'), onPressed: (){}),
                  CupertinoButton(child: Text('아이디저장'), onPressed: (){}),
                ]
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
              child: Text('오떼 시작하기', style: TextStyle(fontSize: 20),),
              color: Colors.white54,
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
                onPressed: () {
                  print('click');
                }),
          ],
        ),
      );
  }

  _buildLoginTextField() {
    return Container(
      width: 200,
      child: Column(
        children: [
          TextField(
            controller: widget.idTextFieldController,
            decoration: InputDecoration(hintText: '아이디'),
          ),
          Padding(padding: EdgeInsets.all(5)),
          TextField(
            controller: widget.pwTextFieldController,
            decoration: InputDecoration(hintText: '비밀번호'),
          ),
        ],
      ),
    );
  }

}
