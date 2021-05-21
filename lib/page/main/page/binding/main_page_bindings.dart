import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/food_detail_page_controller.dart';
import 'package:oftable_flutter/page/main/controller/search_result_controller.dart';

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