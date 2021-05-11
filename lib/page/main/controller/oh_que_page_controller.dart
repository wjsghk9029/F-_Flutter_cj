import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/controller/LoginPageService.dart';
import 'package:oftable_flutter/page/main/Utility/main_utill.dart';
import 'package:oftable_flutter/page/main/model/tag_food_list.dart';



class OhQuePageController extends GetxController{
  LoginPageService _loginPageService = Get.put(LoginPageService());

  RxBool isLoading = true.obs;
  Rx<TagFoodList> foodList = TagFoodList().obs;
  RxInt listIndex = 0.obs;

  @override
  void onInit() {
    changeListIdx(1);
    super.onInit();
  }

  void changeListIdx(int idx){
    listIndex(idx);
   _getTagFoodList(listIndex.value, 1);
  }


  Future<void> _getTagFoodList (int listIdx, int page) async {
    try {
      isLoading(true);
      var _foodList = await MainPageUtil.getTagFoodList(listIdx, _loginPageService.accessToken.value, page);
      foodList(_foodList);
      isLoading(false);
    }
    catch (ex) {
      print(ex);
      throw ex;
    }
  }

  Future<bool> postFoodLike (String authorization, int foodSn) async {
    try{
      return await MainPageUtil.postFoodLike(authorization, foodSn);
    }
    catch(ex){
      print(ex);
      throw ex;
    }
  }
}