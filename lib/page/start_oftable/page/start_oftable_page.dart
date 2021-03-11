import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/start_oftable/Widget/interested_table_checkbox.dart';
import 'package:oftable_flutter/page/start_oftable/page/registerpage1.dart';

class StartOfTablePage extends StatefulWidget {
  @override
  _StartOfTablePageState createState() => _StartOfTablePageState();
}

class _StartOfTablePageState extends State<StartOfTablePage> {
  List<bool> checkButtons = <bool>[];
  @override
  void initState() {
    for(int i = 0; i < 9; i++) {
      checkButtons.add(false);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('logo'),
      ),
      body: _buildBody(),
    );
  }


  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("당신의 테이블 관심사를 3개 골라주세요", style: TextStyle(fontSize: 20),),
        Padding(padding: EdgeInsets.only(bottom: 30)),
        Padding(
          padding: EdgeInsets.all(20),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
            ),
            itemCount: checkButtons.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return _buildListItem(context, index);
            }),
        ),
      ],
    );
  }

  _buildListItem(BuildContext context, int index) {
    return InterestedCheckBox(
      size: 40,
      iconSize: 30,
      isChecked: checkButtons[index],
      onPressed: (){
        setState(() {
          checkButtons[index] = !checkButtons[index];
          if(_getCheckonCount() > 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage1()));
          }
        });
      },
    );
  }

  _getCheckonCount() {
    int temp = 0;
    for(int i = 0; i < checkButtons.length; i++) {
      if(checkButtons[i]){
        temp++;
      }
    }
    return temp;
  }
}
