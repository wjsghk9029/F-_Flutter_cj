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


  void onDebounce(Rx<MemInfoText> text){
    text.value.isError(false);
    if(text == idText) return _onDebounceId();
    if(text == pwText) return _onDebouncePw();
    if(text == pwReText) return _onDebouncePwRe();
    if(text == nameText) return _onDebounceName();
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
    super.onInit();
  }

  void _textError(Rx<MemInfoText> text, String ErrorMsg) {
    text.value.isError(true);
    text.value.error(ErrorMsg);
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
}