import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';
import 'package:oftable_flutter/page/register/start_oftable_page.dart';
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
          Container(
            padding: EdgeInsets.only(top: Get.height * 0.15),
            child: MaterialButton(
              minWidth: double.infinity,
              focusElevation: 0,
              hoverElevation: 0,
              highlightElevation: 0,
              elevation: 0,
              child: Text('관심사 설정 저장', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.05),),
              color: Color.fromARGB(100, 255, 255, 255),
              onPressed: () => StartOfTablePage.pageController.animateToPage(4, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn),
            ),
          ),
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
    return ImageCheckBox(
      size: 40,
      isChecked: Register().tableCurationList[index].isChecked,
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
          Register().outputTableList.length > 0
              ? _keywordChild(Register().outputTableList[0])
              : Padding(padding: EdgeInsets.zero),
          Padding(padding: EdgeInsets.only(top: Get.height * 0.1)),
          Register().outputTableList.length > 1
              ? _keywordChild(Register().outputTableList[1])
              : Padding(padding: EdgeInsets.zero),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      child: Text('$name',
                        style: TextStyle(fontSize: Get.width * 0.05, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800, color: Colors.white),),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.5, color: Colors.white))
                      ),
                    ),
                    Text('에 대한',
                      style: TextStyle(fontSize: Get.width * 0.05, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800, color: Colors.white),),
                  ],
                ),
                Text('세부 관심 키워드를 골라주세요',
                  style: TextStyle(fontSize: Get.width * 0.05, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800, color: Colors.white),),
              ],
            ),
          ),
          Container(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.5,
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
      text: Text(
        Register().keywordMap[itemId][index].registerCheckBoxData.itemName,
        style: TextStyle(
            fontSize: 15,
            color: Register().keywordMap[itemId][index].isChecked ? Colors.black : Colors.white,
        ),
      ),
      onPressed: (){
        setState(() {
          Register().keywordMap[itemId][index].isChecked
              ? Register().selectedKeyword.remove(Register().keywordMap[itemId][index].registerCheckBoxData)
              : Register().selectedKeyword.add(Register().keywordMap[itemId][index].registerCheckBoxData);
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
    return ImageCheckBox(
      size: 40,
      isChecked: Register().memberList[index].isChecked,
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
