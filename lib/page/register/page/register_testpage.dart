import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/register/singleton/register_class.dart';
import 'package:oftable_flutter/page/register/singleton/register_singleton.dart';

class RegisterTestPage extends StatefulWidget {
  @override
  _RegisterTestPageState createState() => _RegisterTestPageState();
}

class _RegisterTestPageState extends State<RegisterTestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
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
            _test(Register().outputTableList),
          ],
        ),
        Row(
          children: [
            Text("인원 : "),
            _test2(Register().selectedMember),
          ],
        ),
        Row(
          children: [
            Text("매움 : "),
            _test2(Register().selectedSpicy),
          ],
        ),
        Row(
          children: [
            Text("맛 : "),
            _test2(Register().selectedTaste),
          ],
        ),
        Row(
          children: [
            Text("알러지 : "),
            _test(Register().outputAllergyList),
          ],
        ),
        Row(
          children: [
            Text("큐레이션 : "),
            _test2(Register().selectedTableCuration),
          ],
        ),
        Image.network('http://61.81.99.50:8080/image/as.jpg'),
      ],
    );

  }

  _test(List<RegisterCheckBoxData> reg) {
    String str = '';
    for(int i = 0; i < reg.length; i++){
      var text = reg[i].itemName;
      str += text + ', ';
    }
    return Text(str);
  }

  _test2(RegisterCheckBoxData reg) {
    var text = reg.itemName;
    return Text('$text');
  }

}
