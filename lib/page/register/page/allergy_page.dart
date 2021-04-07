import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/colorsUtil.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';
import 'package:oftable_flutter/page/widget/icon_checkbox.dart';

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
        toolbarHeight: Get.height * 0.1,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Image.asset('assets/logo_white.png',
            fit: BoxFit.cover,
            height: Get.height * 0.075,),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            color: ColorsUtil.indiaCurryYellow,
            height: Get.height * 0.035,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Expanded(child: buildBody()),
        ],
      ),
    );
  }

  Container buildBody() {
    return Container(
      padding: EdgeInsets.only(right: Get.width * 0.05, left: Get.width * 0.05),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("알러지정보를 알려주세요",
            style: TextStyle(fontSize: Get.height * 0.03, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),
            textAlign: TextAlign.start,),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          Container(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 20,
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
