import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/colorsUtil.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';
import 'package:oftable_flutter/page/widget/string_checkbox.dart';

import 'allergy_page.dart';

class RegisterPage2 extends StatefulWidget {
  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  RegisterPage2Utility _util;
  @override
  void initState() {
    _util = RegisterPage2Utility();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: Get.width * 0.05, left: Get.width * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
          _selectSpicy(),
          Padding(padding: EdgeInsets.all(10)),
          _selectTaste(),
          Padding(padding: EdgeInsets.all(10)),
          _selectAllergy()
          ],
        ),

      ),
    );
  }

  _buildBlankText(RegisterCheckBoxData item) {
    var str = item.itemName;
    return Text('$str', style: TextStyle(fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),);
  }



  //#region 매운맛
  _selectSpicy() {
    return Center(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Text('나는', style: TextStyle(fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
                    Container(
                      margin: EdgeInsets.only(right: 3, left: 3),
                      padding: EdgeInsets.only(right: Get.width* 0.05, left: Get.width* 0.05),
                      child: _buildBlankText(Register().selectedSpicy),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 3),
                        )
                      ),
                  ),
                  Text('이다', style: TextStyle(fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 5)),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Register().spicyList.length,
                  childAspectRatio: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: Register().spicyList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return _buildSpicyListItem(context, index);
                }
            ),
          ],
        ),
      ),
    );
  }

  _buildSpicyListItem(BuildContext context, int index) {
    return StringCheckBox(
      iconAppear: true,
      isChecked: Register().spicyList[index].isChecked,
      text: Text(Register().spicyList[index].registerCheckBoxData.itemName, style: TextStyle(fontSize: 20, color: Colors.white), ),
      onPressed: (){
        setState(() {
          _util.resetCheckBox(Register().spicyList);
          Register().spicyList[index].isChecked = !Register().spicyList[index].isChecked;
          Register().selectedSpicy = Register().spicyList[index].registerCheckBoxData;
        });
      },
      borderRadius: BorderRadius.circular(10),
    );

  }

  //#endregion

  //#region 맛

  _selectTaste() {
    return Center(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Text('나는', style: TextStyle(fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
                  Container(
                    margin: EdgeInsets.only(right: 3, left: 3),
                    padding: EdgeInsets.only(right: Get.width* 0.05, left: Get.width* 0.05),
                    child: _buildBlankText(Register().selectedTaste),
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 3),
                        )
                    ),
                  ),
                  Text('맛을 좋아한다.', style: TextStyle(fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 5)),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Register().tasteList.length,
                  childAspectRatio: 2.0,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemCount: Register().tasteList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return _buildTasteListItem(context, index);
                }
            ),
          ],
        ),
      ),
    );
  }

  _buildTasteListItem(BuildContext context, int index) {
    return StringCheckBox(
      iconAppear: true,
      isChecked: Register().tasteList[index].isChecked,
      text: Text(Register().tasteList[index].registerCheckBoxData.itemName, style: TextStyle(fontSize: 20, color: Colors.white), ),
      onPressed: (){
        setState(() {
          _util.resetCheckBox(Register().tasteList);
          Register().tasteList[index].isChecked = !Register().tasteList[index].isChecked;
          Register().selectedTaste = Register().tasteList[index].registerCheckBoxData;
        });
      },
      borderRadius: BorderRadius.circular(10),
    );

  }
  //#endregion

  //#region 알러지

  _selectAllergy() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          alignment: Alignment.centerLeft,
          child: Text('알러지 정보를 알려주세요', style: TextStyle(fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
        ),
        Container(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return _buildAllergy(context, index);
              }
          ),
        ),
      ],
    );
  }

  _buildAllergy(BuildContext context, int index) {
    return StringCheckBox(
      iconAppear: true,
      isChecked: Register().allergyCheckBox[index],
      text: Text(index == 0 ? '알러지 있음' : '알러지 없음' , style: TextStyle(fontSize: 20, color: Colors.white), ),
      onPressed: (){
        setState(() {
          Register().allergyCheckBox[0] = false;
          Register().allergyCheckBox[1] = false;
          Register().allergyCheckBox[index] = true;
          if(index == 0){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=>AllergyPage()));
          }else {
            Register().outputAllergyList = [];
          }
        });
      },
      borderRadius: BorderRadius.circular(10),
    );
  }
//endregion
}