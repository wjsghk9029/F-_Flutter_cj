import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/start_oftable/Widget/icon_checkbox.dart';
import 'package:oftable_flutter/page/start_oftable/Widget/string_checkbox.dart';
import 'package:oftable_flutter/page/start_oftable/page/allergy_page.dart';
import 'package:oftable_flutter/page/start_oftable/singleton/register_singleton.dart';

class RegisterPage2 extends StatefulWidget {
  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final List<bool> _allergyCheckBox = [false, false];
  @override
  void initState() {
    SingletonRegister().page2Test();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: ListView(
        children: [
          _countEatingMember(),
          Padding(padding: EdgeInsets.all(20)),
          _selectSpicy(),
          Padding(padding: EdgeInsets.all(20)),
          _selectTaste(),
          Padding(padding: EdgeInsets.all(20)),
          _selectAllergy()
        ],
      ),
    );
  }

  _countEatingMember() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text('함께 식사할 인원은?', style: TextStyle(fontSize: 20),),
          ),
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
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Text('나는', style: TextStyle(fontSize: 20),),
                    Container(
                      margin: EdgeInsets.only(right: 3, left: 3),
                      padding: EdgeInsets.only(right: 5, left: 5),
                      child: _buildSpicyText(),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(),
                        )
                      ),
                  ),
                  Text('이다', style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 5)),
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
      text: Text(SingletonRegister().spicyList[index].checkBoxString, style: TextStyle(fontSize: 20, color: Colors.white), ),
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
    var str = SingletonRegister().spicyStage.checkBoxString;
    return Text('$str', style: TextStyle(fontSize: 20),);
  }

  _selectTaste() {
    return Center(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Text('나는', style: TextStyle(fontSize: 20),),
                  Container(
                    margin: EdgeInsets.only(right: 3, left: 3),
                    padding: EdgeInsets.only(right: 5, left: 5),
                    child: _buildTasteText(),
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(),
                        )
                    ),
                  ),
                  Text('맛을 좋아한다.', style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: SingletonRegister().tasteList.length,
                  childAspectRatio: 2.0,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: SingletonRegister().tasteList.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return _buildTasteListItem(context, index);
                }
            ),
          ],
        ),
      ),
    );
  }

  _buildTasteListItem(BuildContext context, int index) {
    return StringCheckBox(
      iconAppear: true,
      isChecked: SingletonRegister().tasteList[index].isChecked,
      text: Text(SingletonRegister().tasteList[index].tasteName, style: TextStyle(fontSize: 20, color: Colors.white), ),
      onPressed: (){
        setState(() {
          SingletonRegister().resetTasteCheckBox();
          SingletonRegister().tasteList[index].isChecked = !SingletonRegister().tasteList[index].isChecked;
          SingletonRegister().tasteStage = SingletonRegister().tasteList[index];
        });
      },
      borderRadius: BorderRadius.circular(10),
    );

  }

  _buildTasteText() {
    var str = SingletonRegister().tasteStage.tasteName;
    return Text('$str', style: TextStyle(fontSize: 20),);
  }

  _selectAllergy() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          alignment: Alignment.centerLeft,
          child: Text('알러지 정보를 알려주세요', style: TextStyle(fontSize: 20),),
        ),
        Container(
          //width: 250,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return _buildAllergy(context, index);
              }
          ),
        ),
      ],
    );
  }

  _buildAllergy(BuildContext context, int index) {
    return StringCheckBox(
      iconAppear: true,
      isChecked: _allergyCheckBox[index],
      text: Text(index == 0 ? '알러지 있음' : '알러지 없음' , style: TextStyle(fontSize: 20, color: Colors.white), ),
      onPressed: (){
        setState(() {
          _allergyCheckBox[0] = false;
          _allergyCheckBox[1] = false;
          _allergyCheckBox[index] = true;
          if(index == 0){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=>AllergyPage()));
          }else {
            SingletonRegister().outputAllergyList = [];
          }
        });
      },
      borderRadius: BorderRadius.circular(10),
    );
  }

}