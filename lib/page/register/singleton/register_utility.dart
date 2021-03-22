import 'package:oftable_flutter/page/register/singleton/register_class.dart';
import 'package:oftable_flutter/page/register/singleton/register_singleton.dart';

class RegisterUtility {

  void insertData(List<RegisterCheckBox> items, List<String> texts) async{
    for(int i = 0; i < texts.length; i++){
      items.add(
          RegisterCheckBox(
            registerCheckBoxData: RegisterCheckBoxData(
              itemId: i+1,
              itemName: texts[i],
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


}

class RegisterPage1Utility extends RegisterUtility{
  List<RegisterCheckBox> tableList = [];
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

}
class AllergyPageUtility extends RegisterUtility{
  List<RegisterCheckBox> allergyList = [];
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
    '기타',];
}
class RegisterPage2Utility extends RegisterUtility{
  List<RegisterCheckBox> memberList = [];
  List<RegisterCheckBox> spicyList = [];
  List<RegisterCheckBox> tasteList = [];
  List<String> memberListText = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  List<String> spicyListText = [
    '맵생아',
    '맵린이',
    '맵으론',
    '맵신',
  ];
  List<String> tasteListText = [
    '단',
    '자극적',
    '건강한',
    '자연의',
    '매운',
  ];
}
class RegisterPage3Utility extends RegisterUtility{
  List<RegisterCheckBox> tableCurationList = [];
  List<String> tableCurationListText = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  List<String> keywordListText = [
    '체중감량',
    '체중증량',
    '유지어터',
    '고지혈증',
    '당뇨',
    '보양식',
    '키토제닉',
    '대용식',
    '플렉시테리언',
    '세미',
    '페스코',
    '락토오보',
    '락토',
    '비건',
    '수비드',
    '소',
    '그릴드 바비큐',
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
    '국,탕,찌게',
    '밑반찬',
    '메인반찬',
    '젓갈류',
    '김치',
    '생선',
    '갑각류',
    '어패류',
    '해조류',
    '연체류',
    '기타 수산물',
    '양식',
    '일식',
    '중식',
    '동남아',
    '멕시칸',
    '소주안주',
    '맥주안주',
    '와인안주',
    '막걸리안주',
    '마른안주',
    '초기 이유식',
    '중기 이유식',
    '후기 이유식',
    '유아 반찬',
    '유기농',
    '떡볶이',
    '면류',
    '밥류',
    '튀김류',
  ];
}
class RegisterPage4Utility extends RegisterUtility{}


