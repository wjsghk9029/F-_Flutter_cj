import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';

class MemberInfo extends StatefulWidget {
  @override
  _MemberInfoState createState() => _MemberInfoState();
}

class _MemberInfoState extends State<MemberInfo> {
  final idTextFieldController = TextEditingController();
  final pwTextFieldController = TextEditingController();
  final pwReTextFieldController = TextEditingController();
  final nameTextFieldController = TextEditingController();
  final birthDayTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final email2TextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();
  final phoneAuthTextFieldController = TextEditingController();
  final homeNameTextFieldController = TextEditingController();
  final homePhoneTextFieldController = TextEditingController();
  final homeAdressTextFieldController = TextEditingController();

  @override
  void dispose() {
    idTextFieldController.dispose();
    pwTextFieldController.dispose();
    pwReTextFieldController.dispose();
    nameTextFieldController.dispose();
    birthDayTextFieldController.dispose();
    emailTextFieldController.dispose();
    email2TextFieldController.dispose();
    phoneTextFieldController.dispose();
    phoneAuthTextFieldController.dispose();
    homeNameTextFieldController.dispose();
    homePhoneTextFieldController.dispose();
    homeAdressTextFieldController.dispose();
    super.dispose();
  }

  Widget _buildBody(){
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        margin: EdgeInsets.only(right: Get.width * 0.075, left: Get.width * 0.075, top: Get.height * 0.07),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            InputTextField(label: '아이디', hintText: '아이디 입력', controller: idTextFieldController),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            InputTextField(label: '비밀번호', hintText: '비밀번호 입력', controller: pwTextFieldController, isPassWord: true),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            InputTextField(label: '비밀번호 재확인', hintText: '비밀번호 입력', controller: pwReTextFieldController, isPassWord: true),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            InputTextField(label: '이름', hintText: '이름 입력', controller: nameTextFieldController),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            InputTextField(label: '생년월일', hintText: '8자리 입력', controller: birthDayTextFieldController),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            InputTextField(label: '이메일', hintText: '이메일 입력', controller: emailTextFieldController, isEmail: true,),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
          ],
        ),
      ),
    );
  }

  Column InputTextField({String label, String hintText, @required TextEditingController controller, bool isPassWord, bool isEmail}) {
    bool _isPassWord = isPassWord ?? false;
    bool _isEmail = isEmail ?? false;
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label ?? '라벨', style: TextStyle(fontFamily: FontsUtil.korean, color: Colors.white, fontSize: Get.width * 0.06, fontWeight: FontWeight.w800),),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.02)),
            _isEmail
            ? _emailTextInput(controller, hintText, _isPassWord)
            : _textInputwithIcon(controller, hintText, _isPassWord),
          ],
        );
  }

  Row _emailTextInput(TextEditingController controller, String hintText, bool _isPassWord) {
    return Row(
            children: [
              Flexible(flex: 3,child: _textInputwithIcon(controller, hintText, _isPassWord)),
              Flexible(flex: 2,child: _textInputwithIcon(email2TextFieldController, '   이메일 선택', _isPassWord)),
            ],
          );
  }

  Stack _textInputwithIcon(TextEditingController controller, String hintText, bool _isPassWord) {
    return Stack(
            children: [
              _textInput(controller: controller, hintText: hintText, isPassWord: _isPassWord),
              Container(
                  height: Get.height * 0.05,
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: ()=>controller.clear(),
                    child: SizedBox(
                        width: 20,
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(75, 255, 255, 255),
                          child: Icon(Icons.clear, size: 15, color: Colors.white,),
                        )
                    ),
                  )
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGroundImage(),
          _buildBody(),
          _AppBar(),
        ],
      ),
    );
  }

  Container _textInput({@required TextEditingController controller, String hintText, bool isPassWord}) {
    return Container(
      height: Get.height * 0.05,
      child: TextField(
        obscureText: isPassWord,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(
          fontFamily: FontsUtil.korean,
          color: Colors.white,
          fontSize: Get.width* 0.04,
        ),
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: Get.width* 0.038,
            fontFamily: FontsUtil.korean,
            color: Colors.white60,
            fontWeight: FontWeight.w100,
          ),
          hintText: hintText?? '힌트 텍스트',
          // border: UnderlineInputBorder(
          //     borderSide: BorderSide(color: Colors.white, width: 1.2)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.2)),
        ),
      ),
    );
  }

  Positioned _AppBar() {
    return Positioned(
          width: Get.width,
          child: AppBar(
            shape: Border(bottom: BorderSide(color: Colors.white, width: 0.75)),
            toolbarHeight: Get.height * 0.075,
            elevation: 0,
            shadowColor: Colors.white,
            backgroundColor: Colors.transparent,
            title: Container(
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/상단로고.png',
                fit: BoxFit.cover,
                height: Get.height * 0.05,),
            ),
            automaticallyImplyLeading: false,
          ),
        );
  }

  Container backGroundImage() {
    return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/register_background.jpg'), fit: BoxFit.fill),
          ),
        );
  }

}
