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
    if(text == idText) return onDebounceIdText();
  }

  void onChange(String inputText, Rx<MemInfoText> text){
    text.value.Text(inputText ?? '');
  }

  void onClear(TextEditingController controller, Rx<MemInfoText> text){
    text.update((val) {val.Text = ''.obs; val.Error = null;});
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.clear());
    debounce(text.value.Text, (_)=>onDebounce(text), time: Duration(milliseconds: 500));
  }

  @override
  void onInit() {
    debounce(idText.value.Text, (_)=>onDebounce(idText), time: Duration(milliseconds: 500));
    super.onInit();
  }

  void onDebounceIdText() {
    var regExp = RegExp(r'^[0-9a-z]+$');
    if(idText.value.Text.value.length == 0){
      idText.value.Error('아이디를 입력해주세요');
      print(idText.value.Error.value);
      return;
    }
    if(!regExp.hasMatch(idText.value.Text.value)){
      idText.value.Error('올바른 아이디형식이 아닙니다.');
      print(idText.value.Error.value);
      return;
    }
  }
}