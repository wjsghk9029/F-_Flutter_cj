import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/colorsUtil.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';
import 'package:oftable_flutter/page/widget/icon_checkbox.dart';
import 'package:oftable_flutter/page/widget/string_checkbox.dart';


class RegisterPage3 extends StatefulWidget {

  @override
  _RegisterPage3State createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  RegisterPage3Utility _util;
  @override
  void initState() {
    _util = RegisterPage3Utility();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: Get.width * 0.05, left: Get.width * 0.05),
      child: ListView(
        children: [
          _keyword(),
          Register().outputTableList.length == 0 ?
          Padding(padding: EdgeInsets.zero) :
          Padding(padding: EdgeInsets.only(top: 50)),
          Text('선택질문 입니다',
          style: TextStyle(fontSize: Get.height * 0.02, fontFamily: FontsUtil.nanumGothic),),
          _tableCuration(),
          Padding(padding: EdgeInsets.only(top: 10)),
          _countEatingMember()
        ],
      ),
    );
  }
//#region 테이블큐레이션
  _tableCuration() {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text('주 몇번의 테이블 큐레이션이 필요하세요', style: TextStyle(fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Register().tableCurationList.length,
                childAspectRatio: 1.0,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount:Register().tableCurationList.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return _buildTableCuration(context, index);
              }
          ),
        ],
      ),
    );
  }

  _buildTableCuration(BuildContext context, int index) {
    return IconCheckBox(
      size: 40,
      iconSize: 30,
      isChecked: Register().tableCurationList[index].isChecked,
      iconAppear: true,
      onPressed: (){
        setState(() {
          _util.resetCheckBox(Register().tableCurationList);
          Register().tableCurationList[index].isChecked = !Register().tableCurationList[index].isChecked;
          Register().selectedTableCuration = Register().tableCurationList[index].registerCheckBoxData;
        });
      },
    );
  }

  //#endregion

  //#region 키워드
  _keyword() {
    return Container(
      child: Column(
        children: [
          Register().outputTableList.length > 0 ? _keywordChild(Register().outputTableList[0]) :
          Padding(padding: EdgeInsets.zero),
          Padding(padding: EdgeInsets.only(top: 20)),
          Register().outputTableList.length > 1 ? _keywordChild(Register().outputTableList[1]) :
          Padding(padding: EdgeInsets.zero),
        ],
      ),
    );
  }


  _keywordChild(RegisterCheckBoxData data) {
    var name = data.itemName;
    var itemId = data.itemId;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text('$name',
                  style: TextStyle(fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800, color: ColorsUtil.hibiscusPink),),
                Text('의 세부 관심 키워드를 골라주세요',
                  style: TextStyle(fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
              ],
            ),
          ),
          Container(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: Register().keywordMap[itemId].length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return _buildKeyword(context, index, itemId);
                }
            ),
          ),
        ],
      ),
    );
  }

  _buildKeyword(BuildContext context, int index, int itemId) {
    return StringCheckBox(
      iconAppear: true,
      isChecked: Register().keywordMap[itemId][index].isChecked,
      text: Text(Register().keywordMap[itemId][index].registerCheckBoxData.itemName, style: TextStyle(fontSize: 15, color: Colors.white), ),
      onPressed: (){
        setState(() {
          if(Register().keywordMap[itemId][index].isChecked) {
            Register().selectedKeyword1.remove(Register().keywordMap[itemId][index].registerCheckBoxData);
          } else {
            Register().selectedKeyword1.add(Register().keywordMap[itemId][index].registerCheckBoxData);
          }
          Register().keywordMap[itemId][index].isChecked = !Register().keywordMap[itemId][index].isChecked;
        });
      },
      borderRadius: BorderRadius.circular(10),
    );
  }
 //#endregion

  //#region 식사인원
  Widget _countEatingMember() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text('함께 식사할 인원은?', style: TextStyle(fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Register().memberList.length,
                childAspectRatio: 1.0,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: Register().memberList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index){
                return _buildMemberListItem(context, index);
              }
          ),
        ],
      ),
    );
  }

  _buildMemberListItem(BuildContext context, int index) {
    return IconCheckBox(
      size: 40,
      iconSize: 30,
      isChecked: Register().memberList[index].isChecked,
      iconAppear: true,
      onPressed: (){
        setState(() {
          _util.resetCheckBox(Register().memberList);
          Register().memberList[index].isChecked = !Register().memberList[index].isChecked;
          Register().selectedMember = Register().memberList[index].registerCheckBoxData;
        });
      },
    );
  }

//#endregion

  void _asyncMethod()async {
    await Future.delayed(Duration(microseconds: 1));
    setState(() {
    });
  }

}
