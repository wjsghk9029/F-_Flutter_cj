class RegisterCheckBox {
  final RegisterCheckBoxData registerCheckBoxData;
  final String itemImgURL;
  bool isChecked = false;
  RegisterCheckBox({this.itemImgURL, this.registerCheckBoxData});
}

class RegisterCheckBoxData {
  final int itemId;
  final String itemName;

  RegisterCheckBoxData({this.itemId, this.itemName});
}