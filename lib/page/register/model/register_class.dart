import 'package:flutter/cupertino.dart';

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