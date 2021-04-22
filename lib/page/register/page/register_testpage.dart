import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oftable_flutter/page/login/model/loginclass.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';

import 'Regtest.dart';

class RegisterTestPage extends StatefulWidget {
  @override
  _RegisterTestPageState createState() => _RegisterTestPageState();
}

class _RegisterTestPageState extends State<RegisterTestPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }
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
            Text(_test(Register().outputTableList)),
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
            Text(_test(Register().outputAllergyList)),
          ],
        ),
        Row(
          children: [
            Text("큐레이션 : "),
            _test2(Register().selectedTableCuration),
          ],
        ),
      Row(
          children: [
            Text("키워드 : "),
            Text(_test(Register().selectedKeyword)),
          ],
        ),

        Row(
          children: [
            Text("id : "),
            Text(Register().selectedId),
          ],
        ),

        Row(
          children: [
            Text("pw : "),
            Text(Register().selectedPw),
        ]
    ),

        Row(
          children: [
            Text("home : "),
            Text(Register().selectedHomeAdress),
    ],
        ),

        Row(
          children: [
            Text("ph : "),
            Text(Register().selectedPhone),
    ],
        ),
        MaterialButton(onPressed: testSend, child: Text('보내기'), color: Colors.blueAccent, textColor: Colors.white,),
      ],
    );

  }

  _test(List<RegisterCheckBoxData> reg) {
    String str = '';
    for(int i = 0; i < reg.length; i++){
      var text = reg[i].itemId;
      if(reg.last.itemId == reg[i].itemId){
        str += '$text';
        break;
      }
      str += '$text' + '#';
    }
    return str;
  }

  _test2(RegisterCheckBoxData reg) {
    var text = reg.itemId;
    return Text('$text');
  }

  _test3(RegisterCheckBoxData reg) {
    var text = reg.itemId;
    return '$text';
  }

  Future<Login> doRegisterTest() async {
      final response = await http.post(
        Uri.http('210.93.86.79:8080', '/join'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: (<String, String>{
          'id' : Register().selectedId,
          'pw' : Register().selectedPw,
          'name' : Register().selectedName,
          'phone' : Register().selectedPhone,
          'adress' : Register().selectedHomeAdress,
          'pop' : _test3(Register().selectedMember),
          'spicy_degree' : _test3(Register().selectedSpicy),
          'prefer_flavor' : _test3(Register().selectedTaste),
          'allergy_list' : _test(Register().outputAllergyList),
          'taste_list' : _test(Register().selectedKeyword),
        }),
      );
      if (response.statusCode == 200) {
        return Login.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load album');
      }
    }

  Future<void> testSend() async {
    try {
      var data = await doRegisterTest();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Regtest(data)));
    }catch(err){
      print(err);
    }
  }

  Future<void> _asyncMethod() async {
    await Future.delayed(Duration(microseconds: 1));
    setState(() {
    });
  }
}
