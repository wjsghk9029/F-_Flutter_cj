import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterCheckBox {
  final RegisterCheckBoxData registerCheckBoxData;
  final Image itemBeforeImg;
  final Image itemAfterImg;
  bool isChecked = false;
  RegisterCheckBox({this.itemBeforeImg, this.itemAfterImg, this.registerCheckBoxData});
}

class RegisterCheckBoxData {
  final int itemId;
  final String itemName;

  RegisterCheckBoxData({this.itemId, this.itemName});
}

class MemInfoText {
  RxString text =  ''.obs;
  RxString errorText = ''.obs;
  RxBool isError = false.obs;
  RxString successText = ''.obs;
  RxBool isSuccess = false.obs;
}

class EmailSelectorItem {
  bool isChecked = false;
  final String emailText;
  EmailSelectorItem(this.emailText);
}