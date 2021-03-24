import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopo/kopo.dart';
import 'package:oftable_flutter/page/register/singleton/register_singleton.dart';

class RegisterPage4 extends StatefulWidget {
  @override
  _RegisterPage4State createState() => _RegisterPage4State();
}

class _RegisterPage4State extends State<RegisterPage4> {
  final homeTextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();

  @override
  void dispose() {
    setState(() {
      Register().selectedHomeAdress = homeTextFieldController.text;
      Register().selectedPhone = phoneTextFieldController.text;
    });
    homeTextFieldController.dispose();
    phoneTextFieldController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    homeTextFieldController.text = Register().selectedHomeAdress;
    phoneTextFieldController.text = Register().selectedPhone;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: ListView(
        children: [
          _registerHome(),
          Padding(padding: EdgeInsets.only(top: 10)),
          _registerPhone(),
        ],
      ),
    );
  }

  _registerHome() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text('배송지', style: TextStyle(fontSize: 20),),
                CupertinoButton(child: Text("배송지 찾기"), onPressed: onAdressPressed)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: homeTextFieldController,
              decoration: InputDecoration(
                hintText: '배송지',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _registerPhone() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text('연락처', style: TextStyle(fontSize: 20),),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: phoneTextFieldController,
              decoration: InputDecoration(
                hintText: '연락처',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onAdressPressed() async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => Kopo(),
      ),
    );
    print(model.toJson());
    setState(() {
      homeTextFieldController.text =
      '${model.address} ${model.buildingName}${model.apartment == 'Y' ? '아파트' : ''} ${model.zonecode} ';
      Register().selectedHomeAdress = homeTextFieldController.text;
    });
  }
}
