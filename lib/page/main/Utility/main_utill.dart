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

  static Future<http.Response> postFoodDislike(String authorization, int foodSn) async {
    return http.post(
        Uri.http('210.93.86.79:8080', '/food_dis'),
        headers: <String, String>{
          'Authorization' : authorization,
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: <String, String>{
          'food_sn' : '$foodSn',
        }
    );
  }

  static Future<http.Response> getFoodDtl(int foodSn) async {
    return http.get(
        Uri.http('210.93.86.79:8080', '/get_food_dtl', {'food_sn' : '$foodSn'}),
    );
  }

  static Future<http.Response> getHomePage() async {
    return http.get(
      Uri.http('210.93.86.79:8080', 'homepage'),
    );
  }

  static Future<http.Response> getSearchHashTag(String tagText) async {
    return http.get(
      Uri.http('210.93.86.79:8080', '/search_hash_tag', {'input_tag' : tagText}),
    );
  }

  static Future<http.Response> postAddComment(String authorization, int foodSn, String comment) async {
    return http.post(
        Uri.http('210.93.86.79:8080', '/food_like'),
        headers: <String, String>{
          'Authorization' : authorization,
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: <String, String>{
          'food_sn' : '$foodSn',
          'comment' : comment,
        }
    );
  }

}