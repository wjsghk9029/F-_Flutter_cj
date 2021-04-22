import 'dart:collection';
import 'package:oftable_flutter/page/register/model/register_class.dart';


class Register {
 //#region 싱글톤
  Register._privateConstructor();

  static final Register _instance = Register._privateConstructor();

  factory Register() {
      return _instance;
  }
 //#endregion

  final List<bool> allergyCheckBox = [false, false];

  Queue<RegisterCheckBoxData> selectedTable = Queue();
  List<RegisterCheckBoxData> outputTableList = [];
  List<RegisterCheckBoxData> selectedAllergyList = [];
  List<RegisterCheckBoxData> outputAllergyList = [];
  List<RegisterCheckBoxData> selectedKeyword = [];
  RegisterCheckBoxData selectedMember = RegisterCheckBoxData(itemId: 0, itemName: '');
  RegisterCheckBoxData selectedSpicy = RegisterCheckBoxData(itemId: 0, itemName: '        ');
  RegisterCheckBoxData selectedTaste = RegisterCheckBoxData(itemId: 0, itemName: '        ');
  RegisterCheckBoxData selectedTableCuration = RegisterCheckBoxData(itemId: 0, itemName: '');
  String selectedId = '';
  String selectedPw = '';
  String selectedName = '';
  String selectedPhone = '';
  String selectedHomeAdress = '';
  String selectedHomeAdress2 = '';
  String outputHomeAdress = '';

  List<RegisterCheckBox> tableList = [];
  List<RegisterCheckBox> allergyList = [];
  List<RegisterCheckBox> memberList = [];
  List<RegisterCheckBox> spicyList = [];
  List<RegisterCheckBox> tasteList = [];
  List<RegisterCheckBox> tableCurationList = [];
  Map<int,List<RegisterCheckBox>> keywordMap = {};

  bool checkRegisterPage2() {
    return (allergyCheckBox[0] != allergyCheckBox[1]) && selectedSpicy.itemId != 0 && selectedTaste.itemId != 0;
  }
}

