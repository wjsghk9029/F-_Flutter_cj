import 'package:flutter/material.dart';

class TestTest extends StatefulWidget {
  final String str;

  const TestTest({this.str});
  @override
  _TestTestState createState() => _TestTestState();
}

class _TestTestState extends State<TestTest> {
  String str;
  @override
  void initState() {
    str = widget.str;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(str),
    );
  }
}
