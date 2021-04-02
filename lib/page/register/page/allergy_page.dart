import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'file:///C:/OfTable/oftable_flutter/lib/page/widget/icon_checkbox.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';

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
          width: 500,
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
                    itemCount: Register().allergyList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return _buildListItem(context, index);
                    }),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.bottomRight,
                child: MaterialButton(
                  child: Text('확인', style: TextStyle(color: Colors.white),),
                  color: Colors.blueAccent,
                  onPressed: () => Get.back(),
                ),
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
      isChecked: Register().allergyList[index].isChecked,
      iconAppear: true,
      onPressed: (){
        setState(() {
          if(Register().allergyList[index].isChecked) {
            Register().selectedAllergyList.remove(Register().allergyList[index].registerCheckBoxData);
          } else {
            Register().selectedAllergyList.add(Register().allergyList[index].registerCheckBoxData);
          }
          Register().allergyList[index].isChecked = !Register().allergyList[index].isChecked;
        });
      },
    );
  }

}
