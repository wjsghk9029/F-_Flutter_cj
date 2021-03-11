import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/loginpage.dart';

class RootPage extends StatelessWidget {
  final Stream<int> _timeStreamImprove =
  Stream.periodic(Duration(seconds: 2), (var i) {
    int temp = 1;
    return temp;
  });

  @override
  Widget build(BuildContext context) {
    _delay(context);
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/ic_launcher.png',
            fit: BoxFit.fill,
            height:80,
            width: 80,
          ),
          Text('title', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

  _delay(BuildContext context) async {
    await Future<void>.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }


}

