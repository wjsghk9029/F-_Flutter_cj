import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/controller/register_utility.dart';
import 'package:oftable_flutter/page/register/start_oftable_page.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(Register().allergyCheckBox[1] || !Register().allergyCheckBox[0]){
        StartOfTablePage.beforePageNum == 1
          ? StartOfTablePage.pageController.animateToPage(3, duration: Duration(milliseconds: 150), curve: Curves.fastOutSlowIn)
          : StartOfTablePage.pageController.animateToPage(1, duration: Duration(milliseconds: 150), curve: Curves.fastOutSlowIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Register().allergyCheckBox[1] || !Register().allergyCheckBox[0]
        ? Container()
        : buildBody();
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.only(right: Get.width * 0.075, left: Get.width * 0.075),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("알레르기 정보를 알려주세요.",
            style: TextStyle(color: Colors.white, fontSize: Get.width * 0.055, fontFamily: FontUtil.korean, fontWeight: FontWeight.w800),
            textAlign: TextAlign.start,),
          Text("WHAT ALLERGIES DO YOU HAVE?",
            style: TextStyle(fontSize: Get.width * 0.055, fontFamily: FontUtil.national_park_outline, color: Colors.white, fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Container(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: Register().allergyList.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return _buildListItem(context, index);
                }),
          ),
          Container(
            padding: EdgeInsets.only(top: Get.height * 0.075),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.5),
              ),
              minWidth: double.infinity,
              focusElevation: 0,
              hoverElevation: 0,
              highlightElevation: 0,
              elevation: 0,
              child: Text('선택 완료', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.05),),
              color: Color.fromARGB(100, 255, 255, 255),
              onPressed: () => StartOfTablePage.pageController.animateToPage(3, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn),
            ),
          ),
        ],
      ),
    );
  }

  _buildListItem(BuildContext context, int index) {
    return ImageCheckBox(
      afterImage: Register().allergyList[index].itemAfterImg,
      beforeImage: Register().allergyList[index].itemBeforeImg,
      size: 40,
      isChecked: Register().allergyList[index].isChecked,
      onPressed: (){
        setState(() {
          Register().allergyList[index].isChecked
            ? Register().selectedAllergyList.remove(Register().allergyList[index].registerCheckBoxData)
            : Register().selectedAllergyList.add(Register().allergyList[index].registerCheckBoxData);
          Register().allergyList[index].isChecked = !Register().allergyList[index].isChecked;
        });
      },
    );
  }

}
