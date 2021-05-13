import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/Utility/main_utill.dart';
import 'package:oftable_flutter/page/main/model/food_detail.dart';

class FoodDetailPageController extends GetxController{
  final int foodSerialNumber;
  FoodDetailPageController(this.foodSerialNumber);

  final TextEditingController tipEditingController = TextEditingController();

  RxBool isSettingDone = false.obs;

  Rx<FoodDetailTitle> foodDetailTitle = FoodDetailTitle().obs;
  RxList<FoodDetailRecipe> foodDetailRecipe = <FoodDetailRecipe>[].obs;
  RxList<FoodDetailComment> foodDetailComment = <FoodDetailComment>[].obs;

  @override
  void onClose() {
    tipEditingController.dispose();
    super.onClose();
  }

  @override
  Future<void> onInit() async {
    var data = await _getData();
    _setData(data);
    super.onInit();
  }

  Future<FoodDetailData> _getData() async {
    var jsonData = await MainPageUtil.getFoodDtl(foodSerialNumber);
    if (jsonData.statusCode != 200)
      throw Exception('${jsonData.statusCode} => fail to GetFoodDtl');
    var data = FoodDetail.fromJson(jsonDecode(jsonData.body));
    if (data.error != 0)
      throw Exception('${jsonDecode(jsonData.body)['data']['msg']}');

    return data.data;
  }

  void _setData(FoodDetailData data) {
    isSettingDone(false);
    foodDetailTitle(data.title);
    foodDetailRecipe(data.recipe);
    foodDetailComment(data.comment);
    isSettingDone(true);
  }
}