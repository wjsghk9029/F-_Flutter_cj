import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/main_page_controller.dart';
import 'package:oftable_flutter/page/main/page/home_page.dart';
import 'package:oftable_flutter/page/main/page/megazine_page.dart';
import 'package:oftable_flutter/page/main/page/my_page.dart';
import 'package:oftable_flutter/page/main/page/oh_que_page.dart';
import 'package:oftable_flutter/page/main/page/shop_page.dart';

class MainPage extends GetView<MainPageController> {
  final MainPageController _pageController = Get.put(MainPageController());
  final List<Widget> _pages = [
    ShopPage(),
    OhQuePage(),
    HomePage(),
    MegazinePage(),
    MyPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _pageController.getBottomNavi(),
      body: DoubleBackToCloseApp(
        child: Obx(()=>_pages[_pageController.getCurrentIndex()]),
          snackBar: const SnackBar(
            content: Text('나가고 싶다면 한번 더 누르시오'),
          ),
      ),
    );
  }
}
