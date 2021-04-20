import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';
import 'package:oftable_flutter/page/widget/icon_checkbox.dart';


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
          Padding(padding: EdgeInsets.all(Get.height * 0.05)),
          _selectTaste(),
          Padding(padding: EdgeInsets.all(Get.height * 0.05)),
          _selectAllergy()
          ],
        ),

      ),
    );
  }

  _buildBlankText(RegisterCheckBoxData item) {
    var str = item.itemName;
    return Text('$str', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.05, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),);
  }



  //#region 매운맛
  _selectSpicy() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Text('나는', style: TextStyle(color: Colors.white, fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
                Container(
                  color: Color.fromARGB(150, 255, 255, 255),
                  margin: EdgeInsets.only(right: Get.width* 0.025, left: Get.width* 0.025),
                  padding: EdgeInsets.only(right: Get.width* 0.025, left: Get.width* 0.025),
                  child: _buildBlankText(Register().selectedSpicy),
              ),
              Text('이다', style: TextStyle(color: Colors.white, fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
            ),
            itemCount: Register().spicyList.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index){
              return _buildSpicyListItem(context, index);
            }
        ),
      ],
    );
  }

  _buildSpicyListItem(BuildContext context, int index) {
    return ImageCheckBox(
      beforeImage: Register().spicyList[index].itemBeforeImg,
      afterImage: Register().spicyList[index].itemAfterImg,
      isChecked: Register().spicyList[index].isChecked,
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
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Text('나는', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.05, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
              Container(
                margin: EdgeInsets.only(right: Get.width* 0.025, left: Get.width* 0.025),
                padding: EdgeInsets.only(right: Get.width* 0.025, left: Get.width* 0.025),
                child: _buildBlankText(Register().selectedTaste),
                color: Color.fromARGB(150, 255, 255, 255),
              ),
              Text('맛을 좋아한다.', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.05, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
            ),
            itemCount: Register().tasteList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return _buildTasteListItem(context, index);
            }
        ),
      ],
    );
  }

  _buildTasteListItem(BuildContext context, int index) {
    return ImageCheckBox(
      beforeImage: Register().tasteList[index].itemBeforeImg,
      afterImage: Register().tasteList[index].itemAfterImg,
      isChecked: Register().tasteList[index].isChecked,
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
          child: Text('알러지 정보를 알려주세요.', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.05, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
        ),
        Container(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
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
    return ImageCheckBox(
      afterImage: index == 0 ? Image.asset('assets/favor/알레르기주의2.png') : Image.asset('assets/favor/없음2.png'),
      beforeImage: index == 0 ? Image.asset('assets/favor/알레르기주의1.png') : Image.asset('assets/favor/없음1.png'),
      isChecked: Register().allergyCheckBox[index],
      onPressed: (){
        setState(() {
          Register().allergyCheckBox[0] = false;
          Register().allergyCheckBox[1] = false;
          Register().allergyCheckBox[index] = true;
          if(index != 0){
            Register().outputAllergyList = [];
          }
        });
      },
      borderRadius: BorderRadius.circular(10),
    );
  }
//endregion
}