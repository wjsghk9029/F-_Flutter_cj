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

  void test() {
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