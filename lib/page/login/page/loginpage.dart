import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/login/controller/login_page_controller.dart';
import 'package:oftable_flutter/page/login/logintestgoogle.dart';
import 'package:oftable_flutter/page/register/start_oftable_page.dart';


class LoginPage extends StatelessWidget {
  final LoginPageController _pageController = Get.put(LoginPageController());
  final googleSignIn = GoogleSignIn();
  final AssetImage backgroundImage = AssetImage('assets/Login_background.jpg');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: backgroundImage, fit: BoxFit.cover),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(Get.height * 0.23)),
              Container(
                alignment: Alignment.center,
                  child: Image.asset('assets/logowithtext.png', height: Get.width * 0.15,)
              ),
              Padding(padding: EdgeInsets.all(Get.height * 0.003)),
              Container(
                margin: EdgeInsets.only(left: Get.width * 0.125, right: Get.width * 0.125),
                  child: _loginPart()
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _loginPart(){
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: CupertinoButton(
            child: Text('아이디 / 비밀번호 찾기', style: TextStyle(color: Colors.white, fontSize: Get.height * 0.02),),
            onPressed: (){},
          ),
        ),
        loginInput(controller: _pageController.idTextFieldController, hintText: '아이디'),
        Padding(padding: EdgeInsets.all(Get.height * 0.005)),
        loginInput(controller: _pageController.pwTextFieldController, hintText: '비밀번호', isPassword: true,),
        Padding(padding: EdgeInsets.all(Get.height * 0.01)),
        Container(
          height: Get.height * 0.07,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.25,
                color: Colors.white
              )
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: TextButton(
                    onPressed: _pageController.onPressLoginButton,
                    child: Text(
                      '로그인',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.height * 0.025),
                    ),
                ),
                width: Get.width * 0.35,
                height: Get.height *0.06,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 0.25,
                      color: Colors.white,
                    )
                  )
                ),
                child: SizedBox(
                  child: TextButton(
                    onPressed: ()=>Get.to(StartOfTablePage(), transition: Transition.rightToLeftWithFade),
                    child: Text(
                      '시작하기',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.height * 0.025),
                    ),
                  ),
                  width: Get.width * 0.35,
                  height: Get.height *0.06,
                ),
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.all(Get.height * 0.01)),
        Text(
          'SNS계정으로 로그인하기',
          style: TextStyle(
            color: Colors.white,
            fontSize: Get.width * 0.04
          ),
        ),
        Padding(padding: EdgeInsets.all(Get.height * 0.005)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                iconSize: Get.height * 0.05,
                onPressed: (){},
                icon: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/kakao.png'),
                )
            ),
            IconButton(
                iconSize: Get.height * 0.05,
                onPressed: (){},
                icon: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/naver.png'),
                )
            ),
            IconButton(
              iconSize: Get.height * 0.05,
                onPressed: () async {
                  var data = await _signInWithGoogle();
                  Get.to(GoogleLoginTest(data));
                },
                icon: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/google.png'),
                )
            ),
          ],
        )
      ],
    );
  }

  Container loginInput({@required TextEditingController controller, String hintText, bool isPassword = false}) {
    return Container(
        height: Get.height * 0.05,
        child: TextField(
          obscureText: isPassword,
          textAlignVertical: TextAlignVertical.bottom,
          style: TextStyle(
            fontFamily: FontUtil.korean,
            color: Colors.white,
            fontSize: Get.width* 0.04,
          ),
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              gapPadding: 0,
              borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            filled: true,
            fillColor: Color.fromARGB(75, 255, 255, 255),
            hintStyle: TextStyle(
              fontFamily: FontUtil.korean,
              color: Colors.white,
            ),
            hintText: hintText?? '힌트 텍스트',
            border: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              gapPadding: 0,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
        ),
      );
  }
  
  Future<GoogleSignInAuthentication> _signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;
    return googleAuth;
  }




}
