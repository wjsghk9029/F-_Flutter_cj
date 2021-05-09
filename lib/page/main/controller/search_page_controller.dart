import 'package:get/get.dart';

class SearchPageController extends GetxController{
  RxList<String> localItems = <String>[].obs;
  RxList<String> recommendItems = <String>[].obs;

  @override
  void onInit() {
    localItems.addAll([
      '감자튀김', '주말요리', '머핀', '내일저녁', '다이어트', '감자튀김', '감자튀김', '머핀',
    ]);
    recommendItems.addAll([
      '감자튀김', '주말요리', '머핀', '내일저녁', '다이어트', '감자튀김', '감자튀김', '머핀',
    ]);
    super.onInit();
  }

  void ResetLocalItems(){
    localItems.clear();
  }
}