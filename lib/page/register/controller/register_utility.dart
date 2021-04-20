import 'package:flutter/cupertino.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';

class RegisterUtility {

  void insertData(List<RegisterCheckBox> items, List<String> texts, String assetFolderName, bool needImg) async{
    if(items.length > 0) {
      return;
    }
    for(int i = 0; i < texts.length; i++){
      items.add(
          RegisterCheckBox(
            registerCheckBoxData: RegisterCheckBoxData(
              itemId: i+1,
              itemName: texts[i],
            ),
              //assets/lifestyle/식단관리1.png
            itemBeforeImg: needImg ? Image.asset('assets/$assetFolderName/${texts[i].trim()}1.png', fit: BoxFit.fill,) : null,
            itemAfterImg: needImg ? Image.asset('assets/$assetFolderName/${texts[i].trim()}2.png', fit: BoxFit.fill,) : null,
          )
      );
    }
  }

  void resetCheckBox(List<RegisterCheckBox> items) async{
    for(int i = 0; i < items.length; i++){
      items[i].isChecked = false;
    }
  }


}
class AllergyPageUtility extends RegisterUtility{
  List<String> allergyListText = [
    '달걀',
    '우유',
    '밀',
    '콩',
    '땅콩',
    '밤',
    '생선',
    '조개',
    '간장',
    '바나나',
    '멜론',
    '두유',
    '딸기류',
    '고추',
    '오이',
    '기타',
  ];

  AllergyPageUtility(){
    insertData(Register().allergyList, allergyListText, 'alergy', true);
  }
}
class RegisterPage1Utility extends RegisterUtility{
  List<String> tableListText = [
    '식단관리',
    '채식',
    '육식',
    '간식',
    '간편조리',
    '집밥',
    '해산물',
    '이국적',
    '안주',
    '아무거나',
    '유아식단',
    '분식',
  ];

  void tableEnque (RegisterCheckBox table) async {
    Register().selectedTable.add(table.registerCheckBoxData);
    if(Register().selectedTable.length > 2){
      var item = Register().selectedTable.removeFirst();
      Register().tableList[_getByTableId(item)].isChecked = false;
    }
  }

  int _getByTableId(RegisterCheckBoxData table){
    for(int i = 0; i < Register().tableList.length; i++){
      if(Register().tableList[i].registerCheckBoxData.itemId == table.itemId){
        return i;
      }
    }
    return null;
  }

  RegisterPage1Utility(){
    insertData(Register().tableList, tableListText, 'lifestyle', true);
  }
}
class RegisterPage2Utility extends RegisterUtility{
  List<String> spicyListText = [
    '맵생아',
    '맵린이',
    '맵어른',
    '맵신',
  ];
  List<String> tasteListText = [
    '단',
    '자극적',
    '건강한',
    '신선한',
    '칼칼한',
  ];

  RegisterPage2Utility(){
    insertData(Register().spicyList, spicyListText, 'favor', true);
    insertData(Register().tasteList, tasteListText, 'favor', true);
  }
}
class RegisterPage3Utility extends RegisterUtility{


  List<String> memberListText = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  List<String> tableCurationListText = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  void _insert()async{
    if(Register().keywordMap.isNotEmpty){
      return;
    }
    _insertmap(1, 8, 1);
    _insertmap(2, 6, 9);
    _insertmap(3, 8, 15);
    _insertmap(4, 4, 23);
    _insertmap(5, 3, 27);
    _insertmap(6, 6, 30);
    _insertmap(7, 6, 36);
    _insertmap(8, 5, 42);
    _insertmap(9, 5, 47);
    _insertmap(10, 0, 0);
    _insertmap(11, 5, 52);
    _insertmap(12, 4, 57);
  }
  void _insertmap (int keywordId , int count, int first)async{
    var list = <RegisterCheckBox>[];
    for(int i = first; i < first+count; i++){
      list.add(keywordList[i-1]);
    }
    Register().keywordMap.addAll({keywordId : list});
  }

  List<RegisterCheckBox> keywordList = [];
  List<String> keywordListText = [
    '체중감량',
    '체중증량',
    '유지어터',
    '고지혈증',
    '당뇨',
    '보양식',
    '키토제닉',
    '대용식',
    '플렉시\n테리언',
    '세미',
    '페스코',
    '락토오보',
    '락토',
    '비건',
    '수비드',
    '소',
    '그릴드\n바비큐',
    '돼지',
    '닭/오리',
    '양',
    '부속고기',
    '가공육',
    '떡',
    '빵',
    '과일',
    '샐러드',
    '도시락',
    '냉동식품',
    '레토르트',
    '일품요리',
    '국,탕\n찌게',
    '밑반찬',
    '메인반찬',
    '젓갈류',
    '김치',
    '생선',
    '갑각류',
    '어패류',
    '해조류',
    '연체류',
    '기타\n수산물',
    '양식',
    '일식',
    '중식',
    '동남아',
    '멕시칸',
    '소주안주',
    '맥주안주',
    '와인안주',
    '막걸리\n안주',
    '마른안주',
    '초기\n이유식',
    '중기\n이유식',
    '후기\n이유식',
    '유아\n반찬',
    '유기농',
    '떡볶이',
    '면류',
    '밥류',
    '튀김류',
  ];

  RegisterPage3Utility(){
    insertData(Register().tableCurationList, tableCurationListText, '', false);
    insertData(keywordList, keywordListText, 'keyword', true);
    insertData(Register().memberList, memberListText, '', false);
    _insert();
  }
}
class RegisterPage4Utility extends RegisterUtility{}


