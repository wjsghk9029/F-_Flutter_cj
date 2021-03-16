import 'package:flutter/material.dart';

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
          _countTableQ(),
          Padding(padding: EdgeInsets.all(20)),
          // _selectfood(),
          // Padding(padding: EdgeInsets.all(20)),
          // _id(),
          // Padding(padding: EdgeInsets.all(20)),
          // _pw()
        ],
      ),
    );
  }

  _countTableQ() {

  }
}
