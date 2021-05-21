import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/Utility/main_utill.dart';
import 'package:oftable_flutter/page/main/model/tag_food_list.dart';

class SearchResultController extends GetxController{
  final String tagText;
  SearchResultController(this.tagText);

  final TextEditingController searchInputController = TextEditingController();
  SearchFoodList data = SearchFoodList();
  RxBool isSettingDone = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    try{
      var data = await _getData();
      _setData(data);
      searchInputController.text = tagText;
    }catch(ex){
      print(ex.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
    searchInputController.dispose();
  }

  Future<SearchFoodList> _getData() async {
    var response = await MainPageUtil.getSearchHashTag(tagText);
    if (response.statusCode != 200)
      throw Exception('${response.statusCode} => fail to GetFoodDtl');
    var jsonData = jsonDecode(response.body);
    if (jsonData['error'] != 0)
      throw Exception('${jsonData['data']['msg']}');
    var data = SearchFoodList.fromJson(jsonData);

    return data;
  }

  void _setData(SearchFoodList data) {
    isSettingDone(false);
    this.data = data;
    isSettingDone(true);
  }


}