import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/food_detail_page_controller.dart';

class FoodDetailBinding implements Bindings{
  final int foodSerialNumber;
  FoodDetailBinding(this.foodSerialNumber);

  @override
  void dependencies() {
    Get.put(FoodDetailPageController(foodSerialNumber));
  }
}