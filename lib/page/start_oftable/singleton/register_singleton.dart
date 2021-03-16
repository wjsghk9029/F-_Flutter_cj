import 'dart:collection';

import 'package:oftable_flutter/page/start_oftable/singleton/register_class.dart';

class Register {
 //싱글톤
  Register._privateConstructor();

  static final Register _instance = Register._privateConstructor();

  factory Register() {
      return _instance;
  }
 //~ 싱글톤

  Queue<FoodTable> selectedTable = new Queue();
  List<InterestedTable> tableList = [];
  List<Allergy> selectedAllergyList = [];
  List<Allergy> outputAllergyList = [];
  List<CheckBoxAllergy> allergyList = [];
  List<EatingMember> memberList = [];
  List<Spicy> spicyList = [];
  List<Taste> tasteList = [];
  int eatingMember = 0;
  Spicy spicyStage = Spicy(checkBoxString: '        ');
  Taste tasteStage = Taste(tasteName: '         ');


  Future<void> tableEnque (InterestedTable table) async {
    selectedTable.add(table.foodTable);
    if(selectedTable.length > 3){
      var item = selectedTable.removeFirst();
      var id = _getByTableId(item);
      tableList[id].isChecked = false;
    }
  }

  Future<void> tableDeque (InterestedTable table) async {
    selectedTable.remove(table.foodTable);
  }

  int _getByTableId(FoodTable table){
    for(int i = 0; i < tableList.length; i++){
      if(tableList[i].foodTable.tableId == table.tableId){
        return i;
      }
    }
    return null;
  }

  void test() async{
    if(tableList.length > 0){
      return;
    }
    for(int i = 0; i < 9; i++){
      tableList.add(
        InterestedTable(
          foodTable: FoodTable(
            imgURL: '',
            tableId: i,
            tableName: '$i',
          )
        )
      );
    }
  }

  void allergyTest() async{
    if(allergyList.length > 0){
      return;
    }
    for(int i = 0; i < 16; i++){
      allergyList.add(
          CheckBoxAllergy(
              allergy: Allergy(
                imgURL: '',
                allergyId: i,
                allergyName: '$i',
              )
          )
      );
    }
  }

  void page2Test() async{
    memberTest();
    spicyListTest();
    tasteListTest();
  }

  void memberTest() async{
    if(memberList.length > 0){
      return;
    }
    for(int i = 0; i < 5; i++){
      memberList.add(
          EatingMember(
            memberCount: i,
            imgURL: '',
          )
      );
    }
  }

  void spicyListTest() async{
    if(spicyList.length > 0){
      return;
    }
    for(int i = 0; i < 4; i++){
      spicyList.add(
          Spicy(
            spicyStage: i,
            checkBoxString: '$i',
            imgURL: '',
          )
      );
    }
  }

  void tasteListTest() async{
    if(tasteList.length > 0){
      return;
    }
    for(int i = 0; i < 4; i++){
      tasteList.add(
          Taste(
            tasteId: i,
            tasteName: '$i',
            imgURL: '',
          )
      );
    }
  }


  void resetMemberCheckBox() async{
    for(int i = 0; i < memberList.length; i++){
      memberList[i].isChecked = false;
    }
  }

  void resetSpicyCheckBox() async{
    for(int i = 0; i < spicyList.length; i++){
      spicyList[i].isChecked = false;
    }
  }

  void resetTasteCheckBox() async{
    for(int i = 0; i < tasteList.length; i++){
      tasteList[i].isChecked = false;
    }
  }
}

