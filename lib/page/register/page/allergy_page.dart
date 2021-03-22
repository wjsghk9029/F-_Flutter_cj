import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/register/Widget/icon_checkbox.dart';
import 'package:oftable_flutter/page/register/singleton/register_singleton.dart';
import 'package:oftable_flutter/page/register/singleton/register_utility.dart';

class AllergyPage extends StatefulWidget {
  @override
  _AllergyPageState createState() => _AllergyPageState();
}

class _AllergyPageState extends State<AllergyPage> {

  AllergyPageUtility util;

  @override
  void dispose() {
    Register().outputAllergyList = Register().selectedAllergyList;
    super.dispose();
  }

  @override
  void initState() {
    util = AllergyPageUtility();
    util.insertData(util.allergyList, util.allergyListText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 1000,
          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("알러지를 선택해 주세요", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                    ),
                    itemCount: util.allergyList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return _buildListItem(context, index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildListItem(BuildContext context, int index) {
    return IconCheckBox(
      size: 40,
      iconSize: 30,
      isChecked: util.allergyList[index].isChecked,
      iconAppear: true,
      onPressed: (){
        setState(() {
          if(util.allergyList[index].isChecked) {
            Register().selectedAllergyList.remove(util.allergyList[index].registerCheckBoxData);
          } else {
            Register().selectedAllergyList.add(util.allergyList[index].registerCheckBoxData);
          }
          util.allergyList[index].isChecked = !util.allergyList[index].isChecked;
        });
      },
    );
  }

}
