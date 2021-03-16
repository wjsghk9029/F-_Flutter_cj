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

class Allergy {
  final String imgURL;
  final int allergyId;
  final String allergyName;
  Allergy({this.imgURL, this.allergyId, this.allergyName});
}

class CheckBoxAllergy {
  final Allergy allergy;
  bool isChecked = false;
  CheckBoxAllergy({this.allergy});
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

class Taste {
  final String imgURL;
  final int tasteId;
  final String tasteName;
  bool isChecked = false;
  Taste({this.imgURL, this.tasteId, this.tasteName});
}