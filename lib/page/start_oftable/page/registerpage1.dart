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
    SingletonRegister().test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("당신의 테이블 관심사를 3개 골라주세요", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
              ),
              itemCount: SingletonRegister().tableList.length,
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
      isChecked: SingletonRegister().tableList[index].isChecked,
      iconAppear: true,
      onPressed: (){
        setState(() {
          if(SingletonRegister().tableList[index].isChecked) {
            SingletonRegister().tableDeque(SingletonRegister().tableList[index]);
          } else {
            SingletonRegister().tableEnque(
                SingletonRegister().tableList[index]);
          }
          SingletonRegister().tableList[index].isChecked = !SingletonRegister().tableList[index].isChecked;
        });
      },
    );
  }

}
