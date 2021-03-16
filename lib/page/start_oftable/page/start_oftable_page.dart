import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/start_oftable/page/registerpage1.dart';
import 'package:oftable_flutter/page/start_oftable/page/registerpage2.dart';
import 'package:oftable_flutter/page/start_oftable/page/registerpage3.dart';
import 'package:oftable_flutter/page/start_oftable/page/registerpage4.dart';

class StartOfTablePage extends StatefulWidget {
  @override
  _StartOfTablePageState createState() => _StartOfTablePageState();
}

class _StartOfTablePageState extends State<StartOfTablePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('logo'),
      //   elevation: 0,
      // ),

      body: PageView(
          children: [
            RegisterPage1(),
            RegisterPage2(),
            RegisterPage3(),
            RegisterPage4(),
          ],
      ),
    );
  }

}
