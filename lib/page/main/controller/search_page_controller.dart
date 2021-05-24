import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/page/binding/main_page_bindings.dart';
import 'package:oftable_flutter/page/main/page/search_result_page.dart';

class SearchPageController extends GetxController{
  final secureStorage = FlutterSecureStorage();
  RxList<String> localItems = <String>[].obs;
  RxList<String> recommendItems = <String>[].obs;

  @override
  void onInit() async{
    localItems(await getLocalItems());
    recommendItems.addAll([
      '감자튀김', '주말요리', '머핀', '내일저녁', '다이어트', '감자튀김', '감자튀김', '머핀',
    ]);
    super.onInit();
  }

  Future<void> resetLocalItems() async {
    localItems.clear();
    await secureStorage.delete(key: 'localSearchItem');
  }

  Future<List<String>> getLocalItems() async {
    if(!(await secureStorage.containsKey(key: 'localSearchItem')))
      return [];
    var items = await secureStorage.read(key: 'localSearchItem');
    return items.split('#');
  }

  String listToString(List<String> list) {
    var temp = '';
    for(var item in list){
      if(list.last == item){
        temp += item;
        break;
      }
      temp += item + '#';
    }
    return temp;
  }

  void onSubmit (String item) {
    if(item.isEmpty) return;
    updateLocalItems(item);
    Get.to(SearchResultPage(), binding: SearchResultBinding(item), transition: Transition.cupertino);
  }

  Future<void> updateLocalItems (String item) async {
    if(localItems.contains(item)) return;
    if(localItems.length > 7)
      localItems.removeAt(0);
    localItems.add(item);
    await secureStorage.delete(key: 'localSearchItem');
    await secureStorage.write(key: 'localSearchItem', value: listToString(localItems));
  }
}