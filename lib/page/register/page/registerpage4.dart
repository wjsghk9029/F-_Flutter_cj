import 'package:flutter/material.dart';

class RegisterPage4 extends StatefulWidget {
  @override
  _RegisterPage4State createState() => _RegisterPage4State();
}

class _RegisterPage4State extends State<RegisterPage4> {
  final homeTextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();

  @override
  void dispose() {
    homeTextFieldController.dispose();
    phoneTextFieldController.dispose();
    super.dispose();
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
            child: Text('배송지', style: TextStyle(fontSize: 20),),
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
}
