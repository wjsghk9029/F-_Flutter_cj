import 'package:flutter/material.dart';

import 'login/loginpage.dart';

class RootPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    _delay(context);
    return Scaffold(
      body: StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return _buildBody(context);
        }
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
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

