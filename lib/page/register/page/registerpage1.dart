import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';
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
      padding: EdgeInsets.only(right: Get.width * 0.05, left: Get.width * 0.05),
      child: ListView(
        children: [
          Row(
            children: [
              Text("나의 푸드 라이프스타일은?",
                style: TextStyle(fontSize: Get.height * 0.03, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),
                textAlign: TextAlign.start,),
              Padding(padding: EdgeInsets.all(5)),
              Text("(2개 선택)",
                style: TextStyle(fontSize: Get.height * 0.022, fontFamily: FontsUtil.nanumGothic),
                textAlign: TextAlign.start,),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 15)),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
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
    return IconCheckBox(
      size: 40,
      iconSize: 30,
      isChecked: Register().tableList[index].isChecked,
      iconAppear: true,
      onPressed: (){
        if(Register().keywordMap.isNotEmpty){
          Register().keywordMap.clear();
        }
        Register().selectedKeyword1 = [];
        setState(() {
          if(Register().tableList[index].isChecked) {
            Register().selectedTable.remove(Register().tableList[index].registerCheckBoxData);
          } else {
            _util.tableEnque(Register().tableList[index]);
          }
          Register().tableList[index].isChecked = !Register().tableList[index].isChecked;
        });
      },
    );
  }
}
