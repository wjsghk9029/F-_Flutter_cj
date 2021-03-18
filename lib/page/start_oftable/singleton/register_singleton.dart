import 'dart:collection';

import 'package:oftable_flutter/page/start_oftable/singleton/register_class.dart';

class Register {
 //#region 싱글톤
  Register._privateConstructor();

  static final Register _instance = Register._privateConstructor();

  factory Register() {
      return _instance;
  }
 //#endregion

  final List<bool> allergyCheckBox = [false, false];

  List<RegisterCheckBox> tableList = [];
  List<RegisterCheckBox> allergyList = [];
  List<RegisterCheckBox> memberList = [];
  List<RegisterCheckBox> spicyList = [];
  List<RegisterCheckBox> tasteList = [];
  List<RegisterCheckBox> tableCurationList = [];
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


  void tableEnque (RegisterCheckBox table) async {
    selectedTable.add(table.registerCheckBoxData);
    if(selectedTable.length > 2){
      var item = selectedTable.removeFirst();
      tableList[_getByTableId(item)].isChecked = false;
    }
  }

  int _getByTableId(RegisterCheckBoxData table){
    for(int i = 0; i < tableList.length; i++){
      if(tableList[i].registerCheckBoxData.itemId == table.itemId){
        return i;
      }
    }
    return null;
  }

  void resetCheckBox(List<RegisterCheckBox> items) async{
    for(int i = 0; i < items.length; i++){
      items[i].isChecked = false;
    }
  }

  void keywordMapSetting(RegisterCheckBoxData table){
    List<RegisterCheckBox> list = [];
    keywordMap.addAll({table.itemId : list});
  }

  //#region 테스트
  void test(List<RegisterCheckBox> items, int boxCount) async{
    if(items.length > 0){
      return;
    }
    for(int i = 0; i < boxCount; i++){
      items.add(
          RegisterCheckBox(
            registerCheckBoxData: RegisterCheckBoxData(
              itemId: i,
              itemName: '$i',
            ),
            itemImgURL: '',
          )
      );
    }
  }

  void testMap() {
    if(keywordMap.length > 0){
      return;
    }
    for(int i = 0; i < tableList.length; i++){
     keywordMapSetting(tableList[i].registerCheckBoxData);
     test(keywordMap[i], 8);
    }
  }
  //#endregion

}

