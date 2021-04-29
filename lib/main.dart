import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:oftable_flutter/page/login/page/rootpage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]); //위에 스텟바 숨기기
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); // 세로로만 UI 표시 설정
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        body: RootPage(),
      ),
    );
  }
}