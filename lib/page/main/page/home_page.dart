import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/home_page_controller.dart';
import 'package:oftable_flutter/page/main/model/home_page_model.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBanner(_homePageController.bannerData),
      ],
    );
  }

  _buildBanner(List<HomPageDataBanner> bannerData) {
    return Container(
      height: Get.height * 0.25,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: bannerData.length,
            itemBuilder: (ctx, idx)=>_bannerItem(bannerData.elementAt(idx)),
          ),
        ],
      ),
    );
  }

  _bannerItem(HomPageDataBanner data) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(data.img_src),
          fit: BoxFit.fill,
        )
      ),
    );
  }
}
