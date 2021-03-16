import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/start_oftable/Widget/icon_checkbox.dart';
import 'package:oftable_flutter/page/start_oftable/singleton/register_singleton.dart';

class AllergyPage extends StatefulWidget {
  @override
  _AllergyPageState createState() => _AllergyPageState();
}

class _AllergyPageState extends State<AllergyPage> {

  @override
  void dispose() {
    Register().outputAllergyList = Register().selectedAllergyList;
    super.dispose();
  }

  @override
  void initState() {
    Register().allergyTest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("알러지를 선택해 주세요", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            GridView.builder(
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
          ],
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
            Register().selectedAllergyList.remove(Register().allergyList[index].allergy);
          } else {
            Register().selectedAllergyList.add(Register().allergyList[index].allergy);
          }
          Register().allergyList[index].isChecked = !Register().allergyList[index].isChecked;
        });
      },
    );
  }

}
