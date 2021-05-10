import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController{
  static final secureStorage = FlutterSecureStorage();
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

  Future<void> updateLocalItems (String item) async {
    print('업데이트');
    if(localItems.length > 8)
      localItems.removeLast();
    localItems.add(item);
    await secureStorage.delete(key: 'localSearchItem');
    await secureStorage.write(key: 'localSearchItem', value: listToString(localItems));
  }
}