import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/start_oftable/singleton/register_singleton.dart';

class RegisterPage3 extends StatefulWidget {
  @override
  _RegisterPage3State createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: ListView(
        children: [
          _page1Test(),

        ],
      ),
    );
  }

  _page1Test() {
    return Column(
      children: [
        Row(
          children: [
            Text("테이블 관심사 : "),
            _getSelectedTable(),
          ],
        ),
        Row(
          children: [
            Text("인원 : "),
            _getMember(),
          ],
        ),
        Row(
          children: [
            Text("알러지 : "),
            _getSelectedAl(),
          ],
        ),
      ],
    );

  }

  _getSelectedTable() {
    var reg = Register().selectedTable.toList();
    String str = '';
    for(int i = 0; i < reg.length; i++){
      var text = reg[i].itemName;
      str += text + ', ';
    }
    return Text(str);
  }

  _getMember() {
    var text = Register().selectedMember.itemName;
    return Text('$text');
  }

  _getSelectedAl() {
    var reg = Register().outputAllergyList;
    String str = '';
    for(int i = 0; i < reg.length; i++){
      var text = reg[i].itemName;
      str += text + ', ';
    }
    return Text(str);
  }
}
