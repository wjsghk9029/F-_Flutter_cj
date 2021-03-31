import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/Utility/main_utill.dart';
import 'package:oftable_flutter/page/main/model/tag_food_list.dart';



class OhQuePageController extends GetxController{
  RxBool isLoading = true.obs;
  Rx<TagFoodList> foodList = TagFoodList().obs;

  @override
  void onInit() {
    getTagFoodList(1);
    super.onInit();
  }


  Future<void> getTagFoodList (int listIdx) async {
    try{
      var _foodList = await MainPageUtil.getTagFoodList(listIdx);
      foodList(_foodList);
      isLoading(false);
    }
    catch(ex){
      print(ex);
    }
  }

}