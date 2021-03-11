import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
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
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() => keyboardOpen = visible);
      },
    );
  }

  @override
  void dispose() {
    widget.idTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
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
            SizedBox()
            : Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 100)),
              MaterialButton(
                onPressed: (){},
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
        ),
      ],
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
