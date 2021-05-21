import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/bottom_navi_service.dart';

class BottomNavigation extends StatelessWidget {
  final BottomNaviService _service = Get.find();
  @override
  Widget build(BuildContext context) {
    return _buildBottomNavi();
  }
  _buildBottomNavi() {
    return Obx(()=> AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      height: _service.isVisible.value ? Get.height * 0.085 : 0.0,
      child: Wrap(
        children: <Widget>[
          BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _service.currentIndex.value,
            onTap: (idx) => _service.changeIndex(idx, false),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/F#_shop.png', fit: BoxFit.cover, height: Get.height * 0.045,),
                activeIcon : Image.asset('assets/F#_shop_HP.png', fit: BoxFit.fill, height: Get.height * 0.045,),
                label: '숍',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/F# curation.png', fit: BoxFit.cover, height: Get.height * 0.045,),
                activeIcon : Image.asset('assets/F#_curation_HP.png', fit: BoxFit.fill, height: Get.height * 0.045,),
                label: '오큐',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: Colors.white,),
                activeIcon: Icon(Icons.home_outlined, color: Colors.red,),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/F# magazine.png', fit: BoxFit.cover, height: Get.height * 0.045,),
                activeIcon : Image.asset('assets/F# magazine HP.png', fit: BoxFit.fill, height: Get.height * 0.045,),
                label: '매거진',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/F# my page.png', fit: BoxFit.cover, height: Get.height * 0.045,),
                activeIcon : Image.asset('assets/F# my page HP.png', fit: BoxFit.fill, height: Get.height * 0.045,),
                label: '마이페이지',
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
