import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/home_page_controller.dart';
import 'package:oftable_flutter/page/main/page/widget/main_appbar.dart';
import 'package:oftable_flutter/page/main/page/widget/page_background_Image.dart';

class HomePage extends StatelessWidget {

  final HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageBackGroundImage(url: 'assets/background/레시피 하단 배경.jpg'),
        _buildBody(),
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          MainPageAppBar(),
          Obx(()=>
          _homePageController.isLoading.isTrue
              ? Padding(
                padding: EdgeInsets.only(top: Get.height *0.1),
                child: SpinKitRing(color: Colors.white,),)
              : _buildContents()
          ),
        ],
      ),
    );
  }

  _buildContents() {
    return Container();
  }
}
