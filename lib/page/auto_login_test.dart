import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oftable_flutter/page/rootpage.dart';

class AutoLoginTest extends StatefulWidget {
  final String acT;
  final String rFT;

  const AutoLoginTest({this.acT, this.rFT});
  @override
  _AutoLoginTestState createState() => _AutoLoginTestState();
}

class _AutoLoginTestState extends State<AutoLoginTest> {
  static final tokenStorage = FlutterSecureStorage();
  String _AcT;
  String _RfT;
  @override
  void initState() {
    _AcT = widget.acT ?? '없음';
    _RfT = widget.rFT ?? '없음';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Text('ACT = $_AcT'),
          Padding(padding: EdgeInsets.all(10)),
          Text('_RfT = $_RfT'),
          Padding(padding: EdgeInsets.all(10)),
          MaterialButton(onPressed: logout, child: Text('로그아웃'),)
        ],
      ),
    );
  }

  Future<void> logout() async {
    await tokenStorage.delete(key: 'access_token');
    await tokenStorage.delete(key: 'refresh_token');
    await tokenStorage.delete(key: 'isAutoLogin');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RootPage()));
  }
}