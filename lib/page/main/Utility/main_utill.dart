import 'dart:convert';

import 'package:oftable_flutter/page/main/model/tag_food_list.dart';
import 'package:http/http.dart' as http;

class MainPageUtil {

  static Future<TagFoodList> getTagFoodList(int listIdx) async {
    final response = await http.get(
      Uri.http('210.93.86.79:8080', '/tag_to_food_list', {'select_food_tag' : '$listIdx'}),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },);
    if (response.statusCode == 200) {
      return TagFoodList.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('${response.request.url} ${response.body} = Failed to Get TagFoodList');
    }
  }
  static Future<bool> postFoodLike(String authorization, int food_sn) async {
    print('$authorization');
    print('$food_sn');
    final response = await http.post(
      Uri.http('210.93.86.79:8080', '/food_like'),
      headers: <String, String>{
        'Authorization' : authorization,
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: <String, String>{
          'food_sn' : '$food_sn',
      }
    );
    if (response.statusCode == 200 && jsonDecode(response.body)['error'] == 0) {
      return true;
    }else {
      throw Exception('${response.request.url} ${response.body} $authorization = Failed to postFoodLike');
    }
  }
}