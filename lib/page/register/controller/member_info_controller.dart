import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';

class MemberInfoController extends GetxController{
  Rx<MemInfoText> idText = MemInfoText().obs;
  Rx<MemInfoText> pwText = MemInfoText().obs;
  Rx<MemInfoText> pwReText = MemInfoText().obs;
  Rx<MemInfoText> nameText = MemInfoText().obs;
  Rx<MemInfoText> birthDayText = MemInfoText().obs;
  Rx<MemInfoText> emailText = MemInfoText().obs;
  Rx<MemInfoText> email2Text = MemInfoText().obs;
  Rx<MemInfoText> phoneText = MemInfoText().obs;
  Rx<MemInfoText> phoneAuthText = MemInfoText().obs;
  Rx<MemInfoText> homeNameText = MemInfoText().obs;
  Rx<MemInfoText> homePhoneText = MemInfoText().obs;
  Rx<MemInfoText> homeAddressText = MemInfoText().obs;


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
    if(text == homeNameText) return _onDebounceHomeName();
    if(text == homePhoneText) return _onDebounceHomePhone();
  }

  void onChange(String inputText, Rx<MemInfoText> text){
    text.value.text(inputText ?? '');
  }

  void onClear(TextEditingController controller, Rx<MemInfoText> text){
    text.update((val) {val.text = ''.obs; val.error = ''.obs; val.isError = false.obs;});
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.clear());
    _debounce(text);
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
    _debounce(homeNameText);
    _debounce(homePhoneText);
    super.onInit();
  }

  void _textError(Rx<MemInfoText> text, String errorMsg) {
    text.value.isError(true);
    text.value.error(errorMsg);
  }

  bool _regMatch(Rx<MemInfoText> text, RegExp regExp) {
    return !regExp.hasMatch(text.value.text.value) && text.value.text.isNotEmpty;
  }

  void _onDebounceId() {
    var regExp = RegExp(r'^[0-9a-z]+$');
    if(_regMatch(idText, regExp))
      return _textError(idText, '올바른 아이디의 형식이 아닙니다.');
  }

  void _onDebouncePw() {
    var regExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$');
    if(_regMatch(pwText, regExp))
      return _textError(pwText, '올바른 비밀번호의 형식이 아닙니다.');
  }

  void _onDebouncePwRe() {
    if(pwReText.value.text.value != pwText.value.text.value  && pwReText.value.text.isNotEmpty)
      return _textError(pwReText, '앞서 입력한 비밀번호와 다릅니다.');
  }

  void _onDebounceName() {
    var regExp = RegExp(r'^[가-힣]{2,4}$');
    if(_regMatch(nameText, regExp))
      return _textError(nameText, '올바른 한글이름의 형식이 아닙니다.');
  }

  void _onDebounceBirthDay() {
    var regExp = RegExp(r'^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$');
    if(_regMatch(birthDayText, regExp))
      return _textError(birthDayText, '올바른 생년월일의 형식이 아닙니다.');
  }

  void _onDebounceEmail() {
    var regExp = RegExp(r'^[0-9a-z]+$');
    if(_regMatch(emailText, regExp))
      return _textError(emailText, '올바른 이메일 아이디의 형식이 아닙니다.');
  }

  void _onDebouncePhone() {
    var regExp = RegExp(r'^\d{3}-\d{3,4}-\d{4}$');
    if(_regMatch(phoneText, regExp))
      return _textError(phoneText, '올바른 전화번호의 형식이 아닙니다.');
  }

  void _onDebouncePhoneAuth() {}

  void _onDebounceHomeName() {
    var regExp = RegExp(r'^[가-힣]{2,4}$');
    if(_regMatch(homeNameText, regExp))
      return _textError(homeNameText, '올바른 한글이름의 형식이 아닙니다.');
  }

  void _onDebounceHomePhone() {
    var regExp = RegExp(r'^\d{3}-\d{3,4}-\d{4}$');
    if(_regMatch(homePhoneText, regExp))
      return _textError(homePhoneText, '올바른 전화번호의 형식이 아닙니다.');
  }
}