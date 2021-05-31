import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/bottom_navi_service.dart';

class MainPageController extends GetxController {
  final BottomNaviService _naviService = Get.put(BottomNaviService());

  getCurrentIndex()=> _naviService.currentIndex.value;
  getBottomNavi() => _naviService.getBottomNavi();
  setPageIndex(int index) => _naviService.currentIndex(index);

  @override
  void onInit() {
    super.onInit();
    _naviService.currentIndex(2);
  }
}