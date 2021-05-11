// ignore_for_file: non_constant_identifier_names


class TagFoodList {
  final String apikey;
  final int error;
  final String type;
  final TagFoodData data;

  TagFoodList({this.apikey, this.error, this.type, this.data});

  factory TagFoodList.fromJson(Map<String, dynamic> json) {
    return TagFoodList(
      apikey: json['apikey'] as String,
      error: json['error'] as int,
      type: json['type'] as String,
      data: TagFoodData.fromJson(json['data']),
    );
  }
}

class TagFoodData {
  final List<TagFoodRecommendListData> recommend_list;
  final List<TagFoodListData> food_list;

  TagFoodData({this.recommend_list, this.food_list});

  factory TagFoodData.fromJson(Map<String, dynamic> json) {
    return TagFoodData(
      recommend_list: (json['recommend_list'] as List).map((e) => TagFoodRecommendListData.fromJson(e)).toList(),
      food_list: (json['food_list'] as List).map((e) => TagFoodListData.fromJson(e)).toList(),
    );
  }
}

class TagFoodRecommendListData{
  final String img_src;
  final String food_description;
  final int food_price;
  final String food_name;
  final int food_serial;
  final int food_level;
  final int food_time;

  TagFoodRecommendListData({this.food_level, this.food_time, this.img_src, this.food_description, this.food_price, this.food_name, this.food_serial});

  factory TagFoodRecommendListData.fromJson(Map<String, dynamic> json) {
    return TagFoodRecommendListData(
      img_src: json['img_src']as String,
      food_description: json['food_description']as String,
      food_price: json['food_price']as int,
      food_name: json['food_name']as String,
      food_serial: json['food_serial']as int,
      food_level: json['food_level']as int,
      food_time: json['food_time']as int,
    );
  }
}

class TagFoodListData{
 final String img_src;
 final String food_description;
 final int food_price;
 final String food_name;
 final int food_serial;
 final int food_level;
 final int food_time;
 final int food_like;

  TagFoodListData({this.food_like, this.food_level, this.food_time, this.img_src, this.food_description, this.food_price, this.food_name, this.food_serial});

 factory TagFoodListData.fromJson(Map<String, dynamic> json) {
   return TagFoodListData(
     img_src: json['img_src']as String,
     food_description: json['food_description']as String,
     food_price: json['food_price']as int,
     food_name: json['food_name']as String,
     food_serial: json['food_serial']as int,
     food_level: json['food_level']as int,
     food_time: json['food_time']as int,
     food_like: json['food_like']as int,
   );
 }
}