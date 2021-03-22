import 'dart:collection';

import 'package:oftable_flutter/page/register/singleton/register_class.dart';

class Register {
 //#region 싱글톤
  Register._privateConstructor();

  static final Register _instance = Register._privateConstructor();

  factory Register() {
      return _instance;
  }
 //#endregion

  final List<bool> allergyCheckBox = [false, false];
  var keywordMap = <int, List<RegisterCheckBox>>{};

  Queue<RegisterCheckBoxData> selectedTable = Queue();
  List<RegisterCheckBoxData> outputTableList = [];
  List<RegisterCheckBoxData> selectedAllergyList = [];
  List<RegisterCheckBoxData> outputAllergyList = [];
  List<RegisterCheckBoxData> selectedKeyword1 = [];
  List<RegisterCheckBoxData> selectedKeyword2 = [];
  RegisterCheckBoxData selectedMember = RegisterCheckBoxData(itemId: 0, itemName: '');
  RegisterCheckBoxData selectedSpicy = RegisterCheckBoxData(itemId: 0, itemName: '        ');
  RegisterCheckBoxData selectedTaste = RegisterCheckBoxData(itemId: 0, itemName: '        ');
  RegisterCheckBoxData selectedTableCuration = RegisterCheckBoxData(itemId: 0, itemName: '');




  void keywordMapSetting(RegisterCheckBoxData table){
    List<RegisterCheckBox> list = [];
    keywordMap.addAll({table.itemId : list});
  }


  //
  // void testMap() {
  //   if(keywordMap.length > 0){
  //     return;
  //   }
  //   for(int i = 0; i < tableList.length; i++){
  //    keywordMapSetting(tableList[i].registerCheckBoxData);
  //    InsertData(keywordMap[i], 8);
  //   }
  // }
  //#endregion

}

