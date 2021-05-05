import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildAppBar();
  }
}

Widget buildAppBar() {
  return AppBar(
    shape: Border(bottom: BorderSide(color: Colors.white, width: 0.75)),
    toolbarHeight: Get.height * 0.075,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Container(
      alignment: Alignment.centerLeft,
      child: Image.asset('assets/logo_white.png',
        fit: BoxFit.cover,
        height: Get.height * 0.045,),
    ),
    automaticallyImplyLeading: false,
    actions: [
      IconButton(icon: Icon(Icons.search, color: Colors.white), iconSize: Get.height * 0.035, onPressed: (){}),
      IconButton(icon: Icon(Icons.favorite_border, color: Colors.white,), iconSize: Get.height * 0.035, onPressed: (){}),
    ],
  );
}
