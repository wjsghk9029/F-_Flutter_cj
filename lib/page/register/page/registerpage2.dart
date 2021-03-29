import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';
import 'package:oftable_flutter/page/widget/string_checkbox.dart';
import 'file:///C:/OfTable/oftable_flutter/lib/page/widget/icon_checkbox.dart';
import 'file:///C:/OfTable/oftable_flutter/lib/page/register/model/register_class.dart';

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
      padding: EdgeInsets.only(right: 20, left: 20),
      child: ListView(
        children: [
          _countEatingMember(),
          Padding(padding: EdgeInsets.all(10)),
          _selectSpicy(),
          Padding(padding: EdgeInsets.all(10)),
          _selectTaste(),
          Padding(padding: EdgeInsets.all(10)),
          _selectAllergy()
        ],
      ),
    );
  }

  _buildBlankText(RegisterCheckBoxData item) {
    var str = item.itemName;
    return Text('$str', style: TextStyle(fontSize: 20),);
  }

  //#region 식사인원
  _countEatingMember() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text('함께 식사할 인원은?', style: TextStyle(fontSize: 20),),
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
                  Text('나는', style: TextStyle(fontSize: 20),),
                    Container(
                      margin: EdgeInsets.only(right: 3, left: 3),
                      padding: EdgeInsets.only(right: 5, left: 5),
                      child: _buildBlankText(Register().selectedSpicy),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(),
                        )
                      ),
                  ),
                  Text('이다', style: TextStyle(fontSize: 20),),
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
                  Text('나는', style: TextStyle(fontSize: 20),),
                  Container(
                    margin: EdgeInsets.only(right: 3, left: 3),
                    padding: EdgeInsets.only(right: 5, left: 5),
                    child: _buildBlankText(Register().selectedTaste),
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(),
                        )
                    ),
                  ),
                  Text('맛을 좋아한다.', style: TextStyle(fontSize: 20),),
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
          child: Text('알러지 정보를 알려주세요', style: TextStyle(fontSize: 20),),
        ),
        Container(
          //width: 250,
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