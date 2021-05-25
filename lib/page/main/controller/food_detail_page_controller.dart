import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/controller/LoginService.dart';
import 'package:oftable_flutter/page/main/Utility/main_utill.dart';
import 'package:oftable_flutter/page/main/model/food_detail.dart';

class FoodDetailPageController extends GetxController{
  LoginService _loginService = Get.find();
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
    _setData(await _getData());
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

  Future<void> addComment(String comment) async {
    var response = await MainPageUtil.postAddComment(_loginService.accessToken.value, foodSerialNumber, comment);
    if (response.statusCode != 200)
      throw Exception('${response.statusCode} => fail to GetFoodDtl');
    var jsonData = jsonDecode(response.body);
    if (jsonData['error'] != 0)
      throw Exception('${jsonData['data']['msg']}');
    print('${jsonData['data']['msg']}');
  }

  Future<void> onPressCommentPost(String comment) async {
    try{
      await addComment(comment);
      _setData(await _getData());
    }catch(ex){
      print(ex.toString());
    }
  }
}