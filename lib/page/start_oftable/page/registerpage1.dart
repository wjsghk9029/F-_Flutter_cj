import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/start_oftable/Widget/icon_checkbox.dart';
import 'package:oftable_flutter/page/start_oftable/singleton/register_singleton.dart';


class RegisterPage1 extends StatefulWidget {
  @override
  _RegisterPage1State createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {

  @override
  void initState() {
    Register().test(Register().tableList, 12);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("당신의 푸드 관심사를 2개 골라주세요", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
              ),
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
        setState(() {
          if(Register().tableList[index].isChecked) {
            Register().tableDeque(Register().tableList[index]);
          } else {
            Register().tableEnque(
                Register().tableList[index]);
          }
          Register().tableList[index].isChecked = !Register().tableList[index].isChecked;
        });
      },
    );
  }

}
