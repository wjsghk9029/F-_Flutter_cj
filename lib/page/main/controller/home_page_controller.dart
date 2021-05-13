import 'dart:convert';

import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/Utility/main_utill.dart';
import 'package:oftable_flutter/page/main/model/home_page_model.dart';

class HomePageController extends GetxController{
  List<HomPageDataBanner> bannerData = [];
  List<HomPageDataProduct> productData = [];
  List<HomPageDataVideo> videoData = [];
  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    await _setData();
    super.onInit();
  }

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
      isLoading(false);
    }catch(ex){
      print(ex);
      Get.back();
    }
  }

}