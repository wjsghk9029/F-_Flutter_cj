import 'dart:convert';

import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/controller/LoginService.dart';
import 'package:oftable_flutter/page/main/Utility/main_utill.dart';
import 'package:oftable_flutter/page/main/model/tag_food_list.dart';



class OhQuePageController extends GetxController{
  LoginService _loginPageService = Get.put(LoginService());

  RxBool isLoading = true.obs;
  RxBool isReCommendLoading = true.obs;
  Rx<TagFoodList> foodList = TagFoodList().obs;
  RxInt listIndex = 0.obs;

  @override
  Future<void> onInit() async {
    await changeListIdx(1);
    isReCommendLoading(false);
    super.onInit();
  }

  Future<void> changeListIdx(int idx) async {
    isLoading(true);
    listIndex(idx);
    await _getFoodList(listIndex.value, 1);
    isLoading(false);
  }


  Future<void> _getFoodList (int listIdx, int page) async {
    try {
      var jsonData = await MainPageUtil.getTagFoodList(listIdx, _loginPageService.accessToken.value, page);
      print(jsonDecode(jsonData.body).toString());
      if(jsonData.statusCode != 200)
        throw Exception('${jsonData.statusCode} => Failed to Post Login');
      var data = TagFoodList.fromJson(jsonDecode(jsonData.body));
      if(data.error != 0)
        throw Exception('${jsonDecode(jsonData.body)['data']['msg']}');
      foodList(data);
    }
    catch (ex) {
      print(ex.toString());
    }
  }

  Future<bool> _postFoodLike (int foodSn) async {
      var jsonData = await MainPageUtil.postFoodLike(_loginPageService.accessToken.value, foodSn);
      if(jsonData.statusCode != 200)
        throw Exception('${jsonData.statusCode} => Failed to Post FoodLike');
      var data = jsonDecode(jsonData.body);
      if(data['error'] as int != 0)
        throw Exception('${data['data']['msg']}');
      return true;
  }

  TagFoodListData _getFoodDataBySerial (int foodSn)
    => foodList.value.data.food_list.where((element) => element.food_serial == foodSn).single;

  Future<void> doFoodLike(int foodSerialNumber) async {
    try{
      if(!(await _postFoodLike(foodSerialNumber))) return;
      var data = _getFoodDataBySerial(foodSerialNumber);
      data.food_like = 1;
      foodList.update((val) {
        for(var data in val.data.food_list){
          if(data.food_serial == foodSerialNumber) data.food_like = 1;
        }
      });
    }catch(ex){
      print(ex);
    }
  }
}