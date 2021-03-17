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

  Queue<RegisterCheckBoxData> selectedTable = Queue();
  List<RegisterCheckBoxData> outputAllergyList = [];
  List<RegisterCheckBoxData> selectedAllergyList = [];
  RegisterCheckBoxData selectedMember;
  RegisterCheckBoxData selectedSpicy = RegisterCheckBoxData(itemId: 0, itemName: '        ');
  RegisterCheckBoxData selectedTaste = RegisterCheckBoxData(itemId: 0, itemName: '        ');


  Future<void> tableEnque (RegisterCheckBox table) async {
    selectedTable.add(table.registerCheckBoxData);
    if(selectedTable.length > 2){
      var item = selectedTable.removeFirst();
      tableList[_getByTableId(item)].isChecked = false;
    }
  }

  Future<void> tableDeque (RegisterCheckBox table) async {
    selectedTable.remove(table.registerCheckBoxData);
  }

  int _getByTableId(RegisterCheckBoxData table){
    for(int i = 0; i < tableList.length; i++){
      if(tableList[i].registerCheckBoxData.itemId == table.itemId){
        return i;
      }
    }
    return null;
  }

  //#region 테스트
  void page2Test() async{
    test(memberList, 5);
    test(spicyList, 4);
    test(tasteList, 5);
  }

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


  void resetCheckBox(List<RegisterCheckBox> items) async{
    for(int i = 0; i < items.length; i++){
      items[i].isChecked = false;
    }
  }

  //#endregion

}

