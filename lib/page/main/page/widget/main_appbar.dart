import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/bottom_navi_service.dart';
import 'package:oftable_flutter/page/main/page/search_page.dart';

class MainPageAppBar extends StatelessWidget {
  final BottomNaviService _naviService = Get.find();
  final bool isNotMainPage;
  MainPageAppBar({this.isNotMainPage = false});
  @override
  Widget build(BuildContext context) {
    return buildAppBar();
  }


  Widget buildAppBar() {
    return Material(
      color: Colors.transparent,
      child: AppBar(
        shape: Border(bottom: BorderSide(color: Colors.white, width: 0.75)),
        toolbarHeight: Get.height * 0.075,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: IconButton(
          onPressed: ()=>_naviService.changeIndex(2, isNotMainPage),
          iconSize: Get.height * 0.06,
          icon: Container(
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            child: Image.asset('assets/상단로고.png',
              fit: BoxFit.cover,
              height: Get.height * 0.045,),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.white), iconSize: Get.height * 0.035, onPressed: ()=>Get.to(SearchPage())),
          IconButton(icon: Icon(Icons.favorite_border, color: Colors.white,), iconSize: Get.height * 0.035, onPressed: (){}),
        ],
      ),
    );
  }
}
