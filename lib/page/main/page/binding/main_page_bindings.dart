import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/food_detail_page_controller.dart';
import 'package:oftable_flutter/page/main/controller/home_video_page_controller.dart';
import 'package:oftable_flutter/page/main/controller/search_result_controller.dart';
import 'package:oftable_flutter/page/main/model/home_page_model.dart';

class FoodDetailBinding implements Bindings{
  final int foodSerialNumber;
  FoodDetailBinding(this.foodSerialNumber);

  @override
  void dependencies() {
    Get.put(FoodDetailPageController(foodSerialNumber));
  }
}

class SearchResultBinding implements Bindings{
  final String tagText;
  SearchResultBinding(this.tagText);

  @override
  void dependencies() {
    Get.put(SearchResultController(tagText));
  }
}

class HomePageVideoBinding implements Bindings{
  final HomPageDataVideo dataVideo;
  HomePageVideoBinding(this.dataVideo);

  @override
  void dependencies() {
    Get.put(HomeVideoPageController(dataVideo));
  }
}
