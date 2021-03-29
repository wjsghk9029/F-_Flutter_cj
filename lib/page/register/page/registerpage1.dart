import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'file:///C:/OfTable/oftable_flutter/lib/page/widget/icon_checkbox.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';


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
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 1000,
        padding: EdgeInsets.only(right: 20, left: 20),
        child: ListView(
          children: [
            Text("당신의 푸드 관심사를 2개 골라주세요", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
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
