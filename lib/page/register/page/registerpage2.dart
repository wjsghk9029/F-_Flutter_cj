import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';
import 'package:oftable_flutter/page/register/start_oftable_page.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Register().selectedTable.length < 2) {
        StartOfTablePage.pageController.jumpToPage(0);
        // StartOfTablePage.pageController.animateToPage(
        //     0, duration: Duration(milliseconds: 150),
        //     curve: Curves.fastOutSlowIn);
        Get.rawSnackbar(
          messageText: Text('푸드 라이프스타일을 2개 선택해주세요', style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 2),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: Get.width * 0.075, left: Get.width * 0.075, top: Get.height * 0.045),
      child: ListView(
        children: [
        _selectSpicy(),
        Padding(padding: EdgeInsets.all(Get.height * 0.04)),
        _selectTaste(),
        Padding(padding: EdgeInsets.all(Get.height * 0.04)),
        _selectAllergy()
        ],
      ),
    );
  }

  _buildBlankText(RegisterCheckBoxData item) {
    return Text('${item.itemName}', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.055, fontFamily: FontsUtil.korean, fontWeight: FontWeight.w800),);
  }



  //#region 매운맛
  _selectSpicy() {
    return Column(
      crossAxisAlignment : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Row(
            children: [
              Text('나는', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.055, fontFamily: FontsUtil.korean, fontWeight: FontWeight.w800),),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(150, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: EdgeInsets.only(right: Get.width* 0.025, left: Get.width* 0.025),
                  padding: EdgeInsets.only(right: Get.width* 0.025, left: Get.width* 0.025),
                  child: _buildBlankText(Register().selectedSpicy),
              ),
              Text('이다', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.055, fontFamily: FontsUtil.korean, fontWeight: FontWeight.w800),),
            ],
          ),
        ),
        Text("WHO AM I?",
          style: TextStyle(fontSize: Get.width * 0.055, fontFamily: FontsUtil.national_park_outline, color: Colors.white, fontWeight: FontWeight.w100),
          textAlign: TextAlign.start,),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Container(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 326.0/209.0,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: Register().spicyList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index){
                return _buildSpicyListItem(context, index);
              }
          ),
        ),
      ],
    );
  }

  _buildSpicyListItem(BuildContext context, int index) {
    return ImageCheckBox(
      beforeImage: Register().spicyList[index].itemBeforeImg,
      afterImage: Register().spicyList[index].itemAfterImg,
      isChecked: Register().spicyList[index].isChecked,
      onPressed: () async {
        setState(() {
          _util.resetCheckBox(Register().spicyList);
          Register().spicyList[index].isChecked = !Register().spicyList[index].isChecked;
          Register().selectedSpicy = Register().spicyList[index].registerCheckBoxData;
        });
        if(await Register().checkRegisterPage2())
          StartOfTablePage.pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      },
    );

  }

  //#endregion

  //#region 맛

  _selectTaste() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Text('나는', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.055, fontFamily: FontsUtil.korean, fontWeight: FontWeight.w800),),
              Container(
                margin: EdgeInsets.only(right: Get.width* 0.025, left: Get.width* 0.025),
                padding: EdgeInsets.only(right: Get.width* 0.025, left: Get.width* 0.025),
                child: _buildBlankText(Register().selectedTaste),
                decoration: BoxDecoration(
                  color: Color.fromARGB(150, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              Text('맛을 좋아한다.', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.055, fontFamily: FontsUtil.korean, fontWeight: FontWeight.w800),),
            ],
          ),
        ),
        Text("WHAT IS YOUR FAVORITE FLAVOR?",
          style: TextStyle(fontSize: Get.width * 0.055, fontFamily: FontsUtil.national_park_outline, color: Colors.white, fontWeight: FontWeight.w100),
          textAlign: TextAlign.start,),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 326.0/209.0,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
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
      onPressed: () async {
        setState(() {
          _util.resetCheckBox(Register().tasteList);
          Register().tasteList[index].isChecked = !Register().tasteList[index].isChecked;
          Register().selectedTaste = Register().tasteList[index].registerCheckBoxData;
        });
        if(await Register().checkRegisterPage2())
          StartOfTablePage.pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      },
    );

  }
  //#endregion

  //#region 알러지

  _selectAllergy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text('알러지 정보를 알려주세요.', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.055, fontFamily: FontsUtil.korean, fontWeight: FontWeight.w800),),
        ),
        Text("DO YOU HAVE ANY ALLEREGIES?",
          style: TextStyle(fontSize: Get.width * 0.055, fontFamily: FontsUtil.national_park_outline, color: Colors.white, fontWeight: FontWeight.w100),
          textAlign: TextAlign.start,),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Container(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 326.0/209.0,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
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
      onPressed: () async {
        setState(() {
          Register().allergyCheckBox[0] = false;
          Register().allergyCheckBox[1] = false;
          Register().allergyCheckBox[index] = true;
          if(index != 0){
            Register().outputAllergyList = [];
          }
        });
        if(await Register().checkRegisterPage2())
          StartOfTablePage.pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      },
    );
  }
//endregion
}