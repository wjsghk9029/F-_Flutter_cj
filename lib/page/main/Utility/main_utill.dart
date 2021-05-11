import 'package:http/http.dart' as http;

class MainPageUtil {

  static Future<http.Response> getTagFoodList(int selectFoodTag, String authorization, int page) async {
    return http.post(
      Uri.http('210.93.86.79:8080', '/recommend_food'),
      headers: <String, String>{
        'Authorization' : authorization,
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
        body: <String, String>{
          'select_food_tag' : '$selectFoodTag',
          'page' : '$page',
        });
  }


  static Future<http.Response> postFoodLike(String authorization, int foodSn) async {
    return http.post(
      Uri.http('210.93.86.79:8080', '/food_like'),
      headers: <String, String>{
        'Authorization' : authorization,
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: <String, String>{
          'food_sn' : '$foodSn',
      }
    );
  }
}