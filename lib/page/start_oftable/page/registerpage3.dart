import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/start_oftable/Widget/icon_checkbox.dart';
import 'package:oftable_flutter/page/start_oftable/singleton/register_singleton.dart';

class RegisterPage3 extends StatefulWidget {
  @override
  _RegisterPage3State createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  @override
  void initState() {
    Register().test(Register().tableCurationList, 5); //테스트용
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: ListView(
        children: [
          _tableCuration(),

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
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text('주 몇번의 테이블 큐레이션이 필요하세요', style: TextStyle(fontSize: 20),),
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Register().tableCurationList.length,
                childAspectRatio: 1.0,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: Register().tableCurationList.length,
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
    return IconCheckBox(
      size: 40,
      iconSize: 30,
      isChecked: Register().tableCurationList[index].isChecked,
      iconAppear: true,
      onPressed: (){
        setState(() {
          Register().resetCheckBox(Register().tableCurationList);
          Register().tableCurationList[index].isChecked = !Register().tableCurationList[index].isChecked;
          Register().selectedTableCuration = Register().tableCurationList[index].registerCheckBoxData;
        });
      },
    );
  }

//#endregion
}
