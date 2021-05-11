import 'dart:convert';
import 'package:oftable_flutter/page/main/model/tag_food_list.dart';
import 'package:http/http.dart' as http;

class MainPageUtil {

  static Future<TagFoodList> getTagFoodList(int select_food_tag, String authorization, int page) async {
    final response = await http.post(
      Uri.http('210.93.86.79:8080', '/recommend_food'),
      headers: <String, String>{
        'Authorization' : authorization,
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
        body: <String, String>{
          'select_food_tag' : '$select_food_tag',
          'page' : '$page',
        });

    if (response.statusCode == 200 && jsonDecode(response.body)['error'] == 0) {
      print('${response.body}');
      return TagFoodList.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('${response.request.url} ${response.body} = Failed to Get TagFoodList');
    }
  }


  static Future<bool> postFoodLike(String authorization, int foodSn) async {
    final response = await http.post(
      Uri.http('210.93.86.79:8080', '/food_like'),
      headers: <String, String>{
        'Authorization' : authorization,
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: <String, String>{
          'food_sn' : '$foodSn',
      }
    );
    if (response.statusCode == 200 && jsonDecode(response.body)['error'] == 0) {
      return true;
    }else {
      throw Exception('${response.request.url} ${response.body} $authorization = Failed to postFoodLike');
    }
  }
}