import 'dart:convert';

import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/Utility/main_utill.dart';
import 'package:oftable_flutter/page/main/model/home_page_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomePageController extends GetxController{
  List<HomPageDataBanner> bannerData = [];
  List<HomPageDataProduct> productData = [];
  List<HomPageDataVideo> videoData = [];
  List<YoutubePlayerController> videoControllers = [];
  RxBool isLoading = true.obs;
  RxInt bannerIndex = 0.obs;

  @override
  Future<void> onInit() async {
    await _setData();
    super.onInit();
  }

  void bannerIndexChange(int index) => bannerIndex(index);

  Future<HomePageData> _getHomepage() async {
    var jsonData = await MainPageUtil.getHomePage();
    if (jsonData.statusCode != 200)
      throw Exception('${jsonData.statusCode} => fail to GetHomePage');
    var data = HomePageModel.fromJson(jsonDecode(jsonData.body));
    if (data.error != 0)
      throw Exception('${jsonDecode(jsonData.body)['data']['msg']}');

    return data.data;
  }

  Future<void> _setData() async {
    try{
      isLoading(true);
      var data = await _getHomepage();
      bannerData = data.banner;
      productData = data.product;
      videoData = data.video;
      for(var data in videoData){
        YoutubePlayerController value = YoutubePlayerController(
            initialVideoId: data.video_num,
            params: YoutubePlayerParams(
              autoPlay: false,
              showControls: true,
              showFullscreenButton: true,
            )
        );
        videoControllers.add(value);
      }
      isLoading(false);
    }catch(ex){
      print(ex);
    }
  }

}