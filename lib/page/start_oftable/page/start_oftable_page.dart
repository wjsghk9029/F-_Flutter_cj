import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/start_oftable/page/registerpage1.dart';

class StartOfTablePage extends StatefulWidget {
  @override
  _StartOfTablePageState createState() => _StartOfTablePageState();
}

class _StartOfTablePageState extends State<StartOfTablePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('logo'),
      ),

      body: RegisterPage1(),
    );
  }

}
