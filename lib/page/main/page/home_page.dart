import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/main/controller/bottom_navi_service.dart';
import 'package:oftable_flutter/page/main/controller/home_page_controller.dart';
import 'package:oftable_flutter/page/main/model/home_page_model.dart';
import 'package:oftable_flutter/page/main/page/binding/main_page_bindings.dart';
import 'package:oftable_flutter/page/main/page/home_video_page.dart';
import 'package:oftable_flutter/page/main/page/widget/main_appbar.dart';
import 'package:oftable_flutter/page/main/page/widget/page_background_Image.dart';
import 'package:oftable_flutter/page/widget/pagebar.dart';

import 'food_detail_page.dart';

class HomePage extends StatelessWidget {
  final BottomNaviService _naviService = Get.find();
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
      controller: _naviService.scrollController,
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
        Padding(padding: EdgeInsets.only(top: 30)),
        _buildProduct(_homePageController.productData),
        _buildVideo(_homePageController.videoData)
      ],
    );
  }

  _buildBanner(List<HomPageDataBanner> bannerData) {
    return Container(
      height: Get.height * 0.25,
      child: Stack(
        children: [
          Container(
            child: PageView.builder(
              onPageChanged: (idx)=> _homePageController.bannerIndexChange(idx),
              itemCount: bannerData.length,
              itemBuilder: (ctx, idx)=>_bannerItem(bannerData.elementAt(idx)),
            ),
          ),
          Obx(()=> Container(
            margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.bottomCenter,
              child: CustomPageBar(
                width: Get.width * 0.6,
                pageViewLength: bannerData.length,
                nowIndex: _homePageController.bannerIndex.value,
              )
          )),
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
      child: Container(
        color: Colors.black.withOpacity(0.25),
        child: Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Text(
            data.banner_dtl,
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontUtil.korean,
              fontSize: Get.height * 0.04,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }

  _buildProduct(List<HomPageDataProduct> productData) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'WHAT\'S NEW',
              style: TextStyle(
                color: Colors.black,
                fontFamily: FontUtil.korean,
                fontWeight: FontWeight.w900,
                fontSize: Get.height * 0.03
              ),
            ),
          ),
          Container(
            height: Get.height * 0.25,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: productData.length,
              itemBuilder:(ctx, idx)=>_productItem(productData.elementAt(idx)),
            ),
          ),
          Padding(padding: EdgeInsets.all(15))
        ],
      ),
    );
  }

  _productItem(HomPageDataProduct data) {
    return GestureDetector(
      onTap: ()=> Get.to(FoodDetailPage(), binding: FoodDetailBinding(data.food_serial)),
      child: Container(
        width: Get.width * 0.5,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(data.img_src),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          color: Colors.black.withOpacity(0.3),
          child: Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text(
                data.food_name,
              style: TextStyle(
                color: Colors.white,
                fontFamily: FontUtil.korean,
                fontWeight: FontWeight.w800,
                fontSize: Get.height*0.025
              ),
            ),
          )
        ),
      ),
    );
  }

  _buildVideo(List<HomPageDataVideo> videoData) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.centerLeft,
            height: Get.height * 0.05,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/F#TV-29.png')
              )
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: videoData.length,
            itemBuilder:(ctx, idx)=>_videoItem(videoData.elementAt(idx)),
          )
        ],
      ),
    );
  }

  _videoItem(HomPageDataVideo dataVideo) {
    return Container(
      height: Get.height * 0.25,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://img.youtube.com/vi/${dataVideo.video_num}/sddefault.jpg'),
          fit: BoxFit.cover,
        )
      ),
      child: Center(
        child: GestureDetector(
          onTap: ()=>Get.to(HomeVideoPage(), binding: HomePageVideoBinding(dataVideo), transition: Transition.cupertino),
          child: Container(
            height: Get.height * 0.075,
            child: Image.asset('assets/youtubePlayIcon.png', fit: BoxFit.fitHeight,),
          ),
        ),
      ),
    );
  }
}
