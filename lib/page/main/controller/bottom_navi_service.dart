import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/page/widget/bottom_Navi.dart';

class BottomNaviService extends GetxService{
  RxInt currentIndex = 2.obs;
  RxBool isVisible = true.obs;
  final ScrollController scrollController = ScrollController();


  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse)
        if (isVisible.value) isVisible(false);
      if (scrollController.position.userScrollDirection == ScrollDirection.forward)
        if (!isVisible.value) isVisible(true);
    });
  }

  BottomNavigation getBottomNavi() => BottomNavigation();
  void changeIndex(int idx)=>currentIndex(idx);
}