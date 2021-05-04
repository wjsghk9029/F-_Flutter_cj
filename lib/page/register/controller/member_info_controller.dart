import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopo/kopo.dart';
import 'package:oftable_flutter/page/login/controller/LoginPageService.dart';
import 'package:oftable_flutter/page/main/main_page.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';
import 'package:oftable_flutter/page/register/utill/register_util.dart';
import 'package:oftable_flutter/page/register/widget/email_selector.dart';

class MemberInfoController extends GetxController{
  LoginPageService _loginPageService = Get.put(LoginPageService());

  Rx<MemInfoText> idText = MemInfoText().obs;
  Rx<MemInfoText> pwText = MemInfoText().obs;
  Rx<MemInfoText> pwReText = MemInfoText().obs;
  Rx<MemInfoText> nameText = MemInfoText().obs;
  Rx<MemInfoText> birthDayText = MemInfoText().obs;
  Rx<MemInfoText> emailText = MemInfoText().obs;
  Rx<MemInfoText> email2Text = MemInfoText().obs;
  Rx<MemInfoText> phoneText = MemInfoText().obs;
  Rx<MemInfoText> phoneAuthText = MemInfoText().obs;
  Rx<MemInfoText> homeAddressText = MemInfoText().obs;
  Rx<MemInfoText> homeAddress2Text = MemInfoText().obs;
  RxBool isDone = false.obs;

  final List<EmailSelectorItem> emailList = [
    EmailSelectorItem('gmail.com'),
    EmailSelectorItem('naver.com'),
    EmailSelectorItem('daum.com'),
  ];


  void onDebounce(Rx<MemInfoText> text) async{
    text.value.isError(false);
    if(text == idText) return _onDebounceId();
    if(text == pwText) return _onDebouncePw();
    if(text == pwReText) return _onDebouncePwRe();
    if(text == nameText) return _onDebounceName();
    if(text == birthDayText) return _onDebounceBirthDay();
    if(text == emailText) return _onDebounceEmail();
    if(text == phoneText) return _onDebouncePhone();
    if(text == phoneAuthText) return _onDebouncePhoneAuth();
  }

  void onChange(String inputText, Rx<MemInfoText> text){
    text.value.text(inputText ?? '');
  }

  void onClear(TextEditingController controller, Rx<MemInfoText> text){
    text.update((val) {
      val.text('');
      val.isSuccess(false);
      val.isError(false);
      val.errorText('');
      val.successText('');
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.clear());
    _debounce(text);
  }

  Future<void> onClickEmailSelector(TextEditingController controller) async {
    String _emailText = await Get.defaultDialog(
      title: "이메일 선택",
      content: EmailSelector(emailList),
    );
    controller.text = _emailText;
    email2Text.value.text(_emailText);
  }

  void onClickDoneButton(){
    _emptyCheck(idText);
    _emptyCheck(pwText);
    _emptyCheck(pwReText);
    _emptyCheck(nameText);
    _emptyCheck(birthDayText);
    _emptyCheck(emailText);
    _emptyCheck(email2Text);
    _emptyCheck(phoneText);
    _emptyCheck(phoneAuthText);
    _emptyCheck(homeAddressText);
    _emptyCheck(homeAddress2Text);
    if(_checkError(idText)) return;
    if(_checkError(pwText)) return;
    if(_checkError(pwReText)) return;
    if(_checkError(nameText)) return;
    if(_checkError(birthDayText)) return;
    if(_checkError(emailText)) return;
    if(_checkError(email2Text)) return;
    if(_checkError(phoneText)) return;
    if(_checkError(phoneAuthText)) return;
    if(_checkError(homeAddressText)) return;
    if(_checkError(homeAddress2Text)) return;
    isDone(true);
    try{
      RegisterUtil.doRegister(
        id: idText.value.text.value,
        pw: pwText.value.text.value,
        name: nameText.value.text.value,
        email: emailText.value.text.value + '@' + email2Text.value.text.value,
        phone: phoneText.value.text.value,
        address: homeAddressText.value.text.value+ ' '+ homeAddress2Text.value.text.value,
      );
      _loginPageService.doLogin(idText.value.text.value, pwText.value.text.value);
    }catch(ex){
      print(ex);
      isDone(false);
      return;
    }
    Get.offAll(MainPage(), transition: Transition.downToUp);
  }

  void _emptyCheck(Rx<MemInfoText> text){
    if(text.value.text.isEmpty)
      return _textError(text, '이 항목은 비어있습니다.');
  }


  void _debounce(Rx<MemInfoText> text,{Duration duration}){
    debounce(text.value.text, (_)=>onDebounce(text), time: duration ?? Duration(milliseconds: 300));
  }

  @override
  void onInit() {
    _debounce(idText);
    _debounce(pwText);
    _debounce(pwReText);
    _debounce(nameText);
    _debounce(birthDayText);
    _debounce(emailText);
    _debounce(phoneText);
    _debounce(phoneAuthText);
    super.onInit();
  }

  void _textReset(Rx<MemInfoText> text) {
    if(text.value.text.isNotEmpty) return;
    text.update((val) {
      val.text('');
      val.isSuccess(false);
      val.isError(false);
      val.errorText('');
      val.successText('');
    });
  }

  void _textError(Rx<MemInfoText> text, String errorMsg) {
    text.update((val) {
      val.isSuccess(false);
      val.isError(true);
      val.errorText(errorMsg);
    });
  }

  void _textSuccess(Rx<MemInfoText> text, String successMsg) {
    text.update((val) {
      val.isError(false);
      val.isSuccess(true);
      val.successText(successMsg);
    });
  }

  bool _regMatch(Rx<MemInfoText> text, RegExp regExp) {
    return !regExp.hasMatch(text.value.text.value) && text.value.text.isNotEmpty;
  }

  Future<void> findAdress(TextEditingController controller) async {
    KopoModel model = await Get.to(Kopo(), transition: Transition.cupertino);
    var addressJSON =
        '${model.address} ${model.buildingName}${model.apartment == 'Y' ? '아파트' : ''}';
    controller.text = addressJSON;
    homeAddressText.value.text(addressJSON);
  }

  bool _checkError(Rx<MemInfoText> text) {
    return text.value.isError.isTrue;
  }

  Future<void> _onDebounceId() async {
    var regExp = RegExp(r'^[0-9a-z]+$');
    if(_regMatch(idText, regExp))
      return _textError(idText, '올바른 아이디의 형식이 아닙니다.');
    if(!(await RegisterUtil.idDuplicateCheck(idText.value.text.value)) && idText.value.text.value.isNotEmpty)
      return _textError(idText, '중복되는 아이디 입니다.');
    if(idText.value.text.value.isNotEmpty)
      return _textSuccess(idText, '사용가능한 아이디입니다.');

    _textReset(idText); // 빈칸일때
  }

  void _onDebouncePw() {
    var regExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$');
    if(_regMatch(pwText, regExp))
      return _textError(pwText, '올바른 비밀번호의 형식이 아닙니다.');

    _textReset(pwText); // 빈칸일때

  }

  void _onDebouncePwRe() {
    if(pwReText.value.text.value != pwText.value.text.value  && pwReText.value.text.isNotEmpty)
      return _textError(pwReText, '앞서 입력한 비밀번호와 다릅니다.');
    if(pwReText.value.text.value.isNotEmpty)
      return _textSuccess(pwReText, '비밀번호가 동일합니다.');

    _textReset(pwReText); // 빈칸일때

  }

  void _onDebounceName() {
    var regExp = RegExp(r'^[가-힣]{2,4}$');
    if(_regMatch(nameText, regExp))
      return _textError(nameText, '올바른 한글이름의 형식이 아닙니다.');

    _textReset(nameText); // 빈칸일때

  }

  void _onDebounceBirthDay() {
    var regExp = RegExp(r'^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$');
    if(_regMatch(birthDayText, regExp))
      return _textError(birthDayText, '올바른 생년월일의 형식이 아닙니다.');

    _textReset(birthDayText); // 빈칸일때

  }

  void _onDebounceEmail() {
    var regExp = RegExp(r'^[0-9a-z]+$');
    if(_regMatch(emailText, regExp))
      return _textError(emailText, '올바른 이메일 아이디의 형식이 아닙니다.');

    _textReset(emailText); // 빈칸일때

  }

  void _onDebouncePhone() {
    var regExp = RegExp(r'^\d{3}\d{3,4}\d{4}$');
    if(_regMatch(phoneText, regExp))
      return _textError(phoneText, '올바른 전화번호의 형식이 아닙니다.');

    _textReset(phoneText); // 빈칸일때

  }

  void _onDebouncePhoneAuth() {}
}