import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/register/Widget/icon_checkbox.dart';
import 'package:oftable_flutter/page/register/singleton/register_singleton.dart';
import 'package:oftable_flutter/page/register/singleton/register_utility.dart';


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
    _util.insertData(_util.tableList, _util.tableListText);
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
                itemCount: _util.tableList.length,
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
      isChecked: _util.tableList[index].isChecked,
      iconAppear: true,
      onPressed: (){
        setState(() {
          if(_util.tableList[index].isChecked) {
            Register().selectedTable.remove(_util.tableList[index].registerCheckBoxData);
          } else {
            _util.tableEnque(_util.tableList[index]);
          }
          _util.tableList[index].isChecked = !_util.tableList[index].isChecked;
        });
      },
    );
  }
}
