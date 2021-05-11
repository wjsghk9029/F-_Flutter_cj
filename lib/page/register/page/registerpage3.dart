import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';
import 'package:oftable_flutter/page/register/page/MemberInfo.dart';
import 'package:oftable_flutter/page/widget/string_checkbox.dart';


class RegisterPage3 extends StatefulWidget {

  @override
  _RegisterPage3State createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  @override
  void initState() {
    RegisterPage3Utility _util = RegisterPage3Utility();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: Get.width * 0.075, left: Get.width * 0.075),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          _keyword(),
          Container(
            padding: EdgeInsets.only(top: Get.height * 0.05),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.5),
              ),
              minWidth: double.infinity,
              focusElevation: 0,
              hoverElevation: 0,
              highlightElevation: 0,
              elevation: 0,
              child: Text('관심사 설정 저장', style: TextStyle(fontFamily: FontUtil.korean, color: Colors.white, fontSize: Get.width * 0.05),),
              color: Color.fromARGB(100, 255, 255, 255),
              onPressed: () => Get.to(MemberInfo(), transition: Transition.cupertino)),
            ),
        ],
      ),
    );
  }
  //#region 키워드
  _keyword() {
    return Container(
      child: Column(
        children: [
          Register().outputTableList.length > 0
              ? _keywordChild(Register().outputTableList[0])
              : Padding(padding: EdgeInsets.zero),
          Padding(padding: EdgeInsets.only(top: Get.height * 0.07)),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      child: Text('$name',
                        style: TextStyle(fontSize: Get.width * 0.055, fontFamily: FontUtil.korean, fontWeight: FontWeight.w800, color: Colors.white),),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.5, color: Colors.white))
                      ),
                    ),
                    Text('에 대한',
                      style: TextStyle(fontSize: Get.width * 0.055, fontFamily: FontUtil.korean, fontWeight: FontWeight.w800, color: Colors.white),),
                  ],
                ),
                Text('세부 관심 키워드를 골라주세요',
                  style: TextStyle(fontSize: Get.width * 0.055, fontFamily: FontUtil.korean, fontWeight: FontWeight.w800, color: Colors.white),),
              ],
            ),
          ),
          Text("SELECT A KEYWORD",
            style: TextStyle(fontSize: Get.width * 0.055, fontFamily: FontUtil.national_park_outline, color: Colors.white, fontWeight: FontWeight.w100),
            textAlign: TextAlign.start,),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Container(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
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

  void _asyncMethod()async {
    await Future.delayed(Duration(microseconds: 1));
    setState(() {
    });
  }

}
