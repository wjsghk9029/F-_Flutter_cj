import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/start_oftable/Widget/icon_checkbox.dart';
import 'package:oftable_flutter/page/start_oftable/Widget/string_checkbox.dart';
import 'package:oftable_flutter/page/start_oftable/singleton/register_singleton.dart';

class RegisterPage2 extends StatefulWidget {
  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  @override
  void initState() {
    SingletonRegister().page2Test();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _countEatingMember(),
            Padding(padding: EdgeInsets.all(10)),
            _selectSpicy(),
          ],
        ),
      )
    );
  }

  _countEatingMember() {
    return Center(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('함께 식사할 인원은?'),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: SingletonRegister().memberList.length,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: SingletonRegister().memberList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return _buildMemberListItem(context, index);
                  }
              ),
            ],
          ),
        ),
    );
  }

  _buildMemberListItem(BuildContext context, int index) {
    return IconCheckBox(
      size: 40,
      iconSize: 30,
      isChecked: SingletonRegister().memberList[index].isChecked,
      iconAppear: true,
      onPressed: (){
        setState(() {
          SingletonRegister().resetMemberCheckBox();
          SingletonRegister().memberList[index].isChecked = !SingletonRegister().memberList[index].isChecked;
          SingletonRegister().eatingMember = SingletonRegister().memberList[index].memberCount;
        });
      },
    );
  }

  _selectSpicy() {
    return Center(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('나는'),
                  Container(
                    margin: EdgeInsets.only(right: 3, left: 3),
                    child: _buildSpicyText(),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(),
                      )
                    ),
                ),
                Text('이다'),
                Padding(padding: EdgeInsets.only(top: 10)),

              ],
            ),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: SingletonRegister().spicyList.length,
                  childAspectRatio: 2.0,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: SingletonRegister().spicyList.length,
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
      isChecked: SingletonRegister().spicyList[index].isChecked,
      text: SingletonRegister().spicyList[index].checkBoxString,
      onPressed: (){
        setState(() {
          SingletonRegister().resetSpicyCheckBox();
          SingletonRegister().spicyList[index].isChecked = !SingletonRegister().spicyList[index].isChecked;
          SingletonRegister().spicyStage = SingletonRegister().spicyList[index];
        });
      },
      borderRadius: BorderRadius.circular(10),
    );

  }

  _buildSpicyText() {
    String str =
    SingletonRegister().spicyStage.checkBoxString != null ? SingletonRegister().spicyStage.checkBoxString :  '          ' ;
    return Text('$str');
  }




}
