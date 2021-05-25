import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/main/controller/home_video_page_controller.dart';
import 'package:oftable_flutter/page/main/page/widget/main_appbar.dart';
import 'package:oftable_flutter/page/main/page/widget/page_background_Image.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomeVideoPage extends GetView<HomeVideoPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageBackGroundImage(url: 'assets/background/레시피 하단 배경.jpg',),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainPageAppBar(isNotMainPage: true,),
        Expanded(child:_buildContent())
      ],
    );
  }

  Widget _buildContent() {
    return Container(
      width: Get.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              height: Get.height * 0.07,
              child: IconButton(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.arrow_back, color: Colors.black,),
                onPressed: ()=>Get.back(),
                iconSize: Get.height * 0.04,
              ),
            ),
          ),
          Obx(()=> controller.isLoading.value
              ? SpinKitRing(color: Colors.blueAccent)
              : _buildPlayer()),
        ],
      ),
    );
  }

  _buildPlayer() {
    return Column(
      children: [
        Obx(()=>controller.showPlayer.value
            ?Container(
              color: Colors.black,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SpinKitRing(color: Colors.blueAccent),
                  YoutubePlayerControllerProvider(
                    controller: controller.playerController,
                    child: YoutubePlayerIFrame(
                        aspectRatio: 4 / 3,
                    ),
                  ),
                ],
              ),
            ) : paddingZero),
        Padding(padding: EdgeInsets.all(5)),
        Text(
          controller.getVideoDetail(),
          style: TextStyle(
            fontSize: Get.height * 0.04,
            fontFamily: FontUtil.korean,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
