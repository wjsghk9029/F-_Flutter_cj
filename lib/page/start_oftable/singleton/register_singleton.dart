import 'dart:collection';

class SingletonRegister {
 //싱글톤
  SingletonRegister._privateConstructor();

  static final SingletonRegister _instance = SingletonRegister._privateConstructor();

  factory SingletonRegister() {
      return _instance;
  }
 //~ 싱글톤

  Queue<FoodTable> selectedTable = new Queue();
  List<InterestedTable> tableList = [];
  List<EatingMember> memberList = [];
  List<Spicy> spicyList = [];
  int eatingMember = 0;
  Spicy spicyStage;


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

  void page2Test() async{
    memberTest();
    spicyListTest();
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
}

class FoodTable {
  final String imgURL;
  final int tableId;
  final String tableName;
  FoodTable({this.imgURL, this.tableName, this.tableId});
}

class InterestedTable {
  final FoodTable foodTable;
  bool isChecked = false;
  InterestedTable({this.foodTable});
}

class EatingMember {
  final String imgURL;
  final int memberCount;
  bool isChecked = false;
  EatingMember({this.imgURL, this.memberCount});
}

class Spicy {
  final String imgURL;
  final int spicyStage;
  final String checkBoxString;
  bool isChecked = false;
  Spicy({this.imgURL, this.spicyStage, this.checkBoxString});
}