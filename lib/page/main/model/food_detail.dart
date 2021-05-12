// ignore_for_file: non_constant_identifier_names

class FoodDetail {
  final String apikey;
  final int error;
  final String type;
  final FoodDetailData data;
  FoodDetail({this.apikey, this.error, this.type, this.data});

  factory FoodDetail.fromJson(Map<String,dynamic> json) {
    return FoodDetail(
      apikey: json['apikey'] as String,
      error: json['error'] as int,
      type: json['type'] as String,
      data: FoodDetailData.fromJson(json['data']),
    );
  }

}

class FoodDetailData {
  final FoodDetailTitle title;
  final List<FoodDetailRecipe> recipe;
  final List<FoodDetailComment> comment;

  FoodDetailData({this.title, this.recipe, this.comment});

  factory FoodDetailData.fromJson(Map<String, dynamic>json) {
    return FoodDetailData(
      title: (json['title'] as List).map((e) => FoodDetailTitle.fromJson(e)).toList().first,
      recipe: (json['recipe'] as List).map((e) => FoodDetailRecipe.fromJson(e)).toList(),
      comment: (json['comment'] as List).map((e) => FoodDetailComment.fromJson(e)).toList(),
    );
  }

}

class FoodDetailTitle{
  final String img_src;
  final String food_name;
  final int food_serial;
  final int food_level;
  final int food_time;
  final String food_dtl;

  FoodDetailTitle(
      {this.img_src,
      this.food_name,
      this.food_serial,
      this.food_level,
      this.food_time,
      this.food_dtl});

  factory FoodDetailTitle.fromJson(Map<String,dynamic> json){
    return FoodDetailTitle(
      img_src: json['img_src'] as String,
      food_name: json['food_name'] as String,
      food_serial: json['food_serial'] as int,
      food_level: json['food_level'] as int,
      food_time: json['food_time'] as int,
      food_dtl: json['food_dtl'] as String,
    );
  }

}

class FoodDetailRecipe{
  final String img_src;
  final String recipe_dtl;

  FoodDetailRecipe(
      {this.img_src,
        this.recipe_dtl});

  factory FoodDetailRecipe.fromJson(Map<String,dynamic> json){
    return FoodDetailRecipe(
      img_src: json['img_src'] as String,
      recipe_dtl: json['recipe_dtl'] as String,
    );
  }

}

class FoodDetailComment{
  final String email;
  final String tip;

  FoodDetailComment({this.email, this.tip});

  factory FoodDetailComment.fromJson(Map<String,dynamic> json){
    return FoodDetailComment(
      email: json['email'] as String,
      tip: json['tip'] as String,
    );
  }
}