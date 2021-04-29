import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/register/controller/member_info_controller.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';

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

  MemberInfoController _memberInfoController = Get.put(MemberInfoController());

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
    return Container(
      margin: EdgeInsets.only(right: Get.width * 0.075, left: Get.width * 0.075),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          children: [
            _inputTextField(label: '아이디', hintText: '아이디 입력', controller: idTextFieldController, controllerText: _memberInfoController.idText),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            _inputTextField(label: '비밀번호', hintText: '비밀번호 입력', controller: pwTextFieldController, isPassWord: true, controllerText: _memberInfoController.pwText),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            _inputTextField(label: '비밀번호 재확인', hintText: '비밀번호 입력', controller: pwReTextFieldController, isPassWord: true, controllerText: _memberInfoController.pwReText),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            _inputTextField(label: '이름', hintText: '이름 입력', controller: nameTextFieldController, controllerText: _memberInfoController.nameText),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            _inputTextField(label: '생년월일', hintText: '8자리 입력', controller: birthDayTextFieldController, controllerText: _memberInfoController.birthDayText),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            _inputTextField(label: '이메일', hintText: '이메일 입력', controller: emailTextFieldController, isEmail: true),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            phoneTextField(),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
            addressTextField(),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.05)),
          ],
        ),
      ),
    );
  }

  Widget addressTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('주소(배송지)', style: TextStyle(fontFamily: FontsUtil.korean, color: Colors.white, fontSize: Get.width * 0.06, fontWeight: FontWeight.w800),),
        Padding(padding: EdgeInsets.only(top: Get.height * 0.02)),
        _textInputwithIcon(homeNameTextFieldController, '받는분 입력', false, _memberInfoController.homeNameText),
        Padding(padding: EdgeInsets.only(top: Get.height * 0.015)),
        _textInputwithIcon(homePhoneTextFieldController, '전화번호 입력', false, _memberInfoController.homePhoneText),
        Padding(padding: EdgeInsets.only(top: Get.height * 0.015)),
        _textInputwithIcon(homeAdressTextFieldController, '주소 입력', false, _memberInfoController.homeAddressText),
    ],
    );
  }


  Widget phoneTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('휴대전화', style: TextStyle(fontFamily: FontsUtil.korean, color: Colors.white, fontSize: Get.width * 0.06, fontWeight: FontWeight.w800),),
        Padding(padding: EdgeInsets.only(top: Get.height * 0.02)),
        Container(
          child: _phoneInput(
            controller: phoneTextFieldController,
            hintText: '전화번호 입력',
            buttonChild: Text(
              '인증번호 받기',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            buttonOnPressed: (){},
            isPassWord: false,
            buttonStyle: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.4)),
            ),
            controllerText: _memberInfoController.phoneText,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: Get.height * 0.015)),
        Container(
          child: _phoneInput(
              controller: phoneTextFieldController,
              hintText: '인증번호 입력',
              buttonChild: Text(
                  '인증번호 확인',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              buttonOnPressed: (){},
              isPassWord: false,
              buttonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.4)),
              ),
            controllerText: _memberInfoController.phoneAuthText,
          ),
        )
      ],
    );
  }

  Widget _phoneInput({TextEditingController controller, String hintText, bool isPassWord, void Function() buttonOnPressed, Widget buttonChild, ButtonStyle buttonStyle, Rx<MemInfoText> controllerText}){
    return Row(
      children: [
        Flexible(flex: 5,child: _textInputwithIcon(controller, hintText, isPassWord, controllerText)),
        Flexible(flex: 2,child: TextButton(onPressed: buttonOnPressed, child: buttonChild, style: buttonStyle,)),
      ],
    );
  }

  Widget _inputTextField({String label, String hintText, @required TextEditingController controller, bool isPassWord, bool isEmail, Rx<MemInfoText> controllerText}) {
    return Container(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label ?? '라벨', style: TextStyle(fontFamily: FontsUtil.korean, color: Colors.white, fontSize: Get.width * 0.06, fontWeight: FontWeight.w800),),
              Padding(padding: EdgeInsets.only(top: Get.height * 0.02)),
              Container(
                child: isEmail ?? false
                        ? _emailTextInput(controller, hintText, isPassWord ?? false)
                        : _textInputwithIcon(controller, hintText, isPassWord ?? false, controllerText),
              ),
            ],
          ),
    );
  }

  Widget _emailTextInput(TextEditingController controller, String hintText, bool _isPassWord) {
    return Row(
            children: [
              Flexible(flex: 3,child: _textInputwithIcon(controller, hintText, _isPassWord, _memberInfoController.emailText)),
              Flexible(flex: 2,child: _textInputwithIcon(email2TextFieldController, '   이메일 선택', _isPassWord, _memberInfoController.email2Text)),
            ],
          );
  }

  Widget _textInputwithIcon(TextEditingController controller, String hintText, bool _isPassWord, Rx<MemInfoText> controllerText) {
    return _textInput(controller: controller, hintText: hintText, isPassWord: _isPassWord, controllerText: controllerText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGroundImage(),
          Column(
            children: [
              _appBar(),
              Expanded(child: _buildBody()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textInput({@required TextEditingController controller, String hintText, bool isPassWord, Rx<MemInfoText> controllerText}) {
    return Obx(()=>
        TextField(
      onChanged: (text)=>_memberInfoController.onChange(text, controllerText),
      onEditingComplete: ()=> FocusScope.of(context).unfocus(),
      obscureText: isPassWord,
      textAlignVertical: TextAlignVertical.bottom,
      style: TextStyle(
        fontFamily: FontsUtil.korean,
        color: Colors.white,
        fontSize: Get.width* 0.04,
      ),
      controller: controller,
      decoration: InputDecoration(
        errorText: controllerText.value.isError.value ? controllerText.value.error.value : null,
        suffixIconConstraints: BoxConstraints(
          maxHeight: Get.width * 0.06,
          maxWidth: Get.width * 0.06,
        ),
        suffixIcon: GestureDetector(
          onTap: ()=>_memberInfoController.onClear(controller, controllerText),
          child: Container(
            margin: EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(100, 255, 255, 255),
              child: Icon(Icons.clear, size: Get.width * 0.04, color: Colors.white,),
            ),
          ),
        ),
        contentPadding: EdgeInsets.only(bottom: 10, top: 5),
        hintStyle: TextStyle(
          fontSize: Get.width* 0.04,
          fontFamily: FontsUtil.korean,
          color: Colors.white60,
          fontWeight: FontWeight.w100,
        ),
        hintText: hintText?? '힌트 텍스트',
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.2)),
      ),
    ));
  }

  Positioned _appBar() {
    return Positioned(
          width: Get.width,
          child: Container(
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
