import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';
import 'package:oftable_flutter/page/register/start_oftable_page.dart';
import 'package:oftable_flutter/page/widget/icon_checkbox.dart';


class RegisterPage1 extends StatefulWidget {
  @override
  _RegisterPage1State createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  RegisterPage1Utility _util;

  @override
  void dispose() {
    Register().outputTableList = Register().selectedTable.toList();
    super.dispose();
  }

  @override
  void initState() {
    _util = RegisterPage1Utility();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(right: Get.width * 0.075, left: Get.width * 0.075, top: Get.height * 0.045),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Row(
            children: [
              Text("나의 푸드 라이프스타일은?",
                style: TextStyle(fontSize: Get.width * 0.055, fontFamily: FontsUtil.korean,  color: Colors.white, fontWeight: FontWeight.w800),
                textAlign: TextAlign.start,),
              Padding(padding: EdgeInsets.all(2)),
              Text("(2개 선택)",
                style: TextStyle(fontSize: Get.width * 0.035, fontFamily: FontsUtil.korean, color: Colors.white),
                textAlign: TextAlign.start,),
            ],
          ),
          Text("MY FOOD LIFE STYLE",
            style: TextStyle(fontSize: Get.width * 0.055, fontFamily: FontsUtil.national_park_outline, color: Colors.white,),
            textAlign: TextAlign.start,),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 456.0 / 455.0,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: Register().tableList.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return _buildListItem(context, index);
              }),
        ],
      ),
    );
  }

  _buildListItem(BuildContext context, int index) {
    return ImageCheckBox(
      afterImage: Register().tableList[index].itemAfterImg,
      beforeImage: Register().tableList[index].itemBeforeImg,
      size: 40,
      isChecked: Register().tableList[index].isChecked,
      onPressed: (){
        if(Register().keywordMap.isNotEmpty) Register().keywordMap.clear();
        Register().selectedKeyword = [];
        setState(() {
          Register().tableList[index].isChecked
              ? Register().selectedTable.remove(Register().tableList[index].registerCheckBoxData)
              : _util.tableEnque(Register().tableList[index]);
          Register().tableList[index].isChecked = !Register().tableList[index].isChecked;
        });
        if(Register().selectedTable.length > 1)
          StartOfTablePage.pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      },
    );
  }
}
