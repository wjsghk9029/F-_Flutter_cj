// ignore_for_file: non_constant_identifier_names

class FoodDescription {
  final String apikey;
  final bool error;
  final String type;
  final FoodDescData data;
  FoodDescription({this.apikey, this.error, this.type, this.data});

  factory FoodDescription.fromJson(Map<String,dynamic> json) {
    return FoodDescription(
      apikey: json['apikey'] as String,
      error: json['error'] as bool,
      type: json['type'] as String,
      data: FoodDescData.fromJson(json['data']),
    );
  }

}

class FoodDescData {
  final FoodDescTitle title;
  final List<FoodDescRecipe> recipe;
  final List<FoodDescComment> comment;

  FoodDescData({this.title, this.recipe, this.comment});

  factory FoodDescData.fromJson(Map<String, dynamic>json) {
    return FoodDescData(
      title: FoodDescTitle.fromJson(json['title'][0]),
      recipe: (json['recipe'] as List).map((e) => FoodDescRecipe.fromJson(e)).toList(),
      comment: (json['comment'] as List).map((e) => FoodDescComment.fromJson(e)).toList(),
    );
  }

}

class FoodDescTitle{
  final String img_src;
  final String food_name;
  final int food_serial;
  final int food_level;
  final int food_time;
  final String food_dtl;

  FoodDescTitle(
      {this.img_src,
      this.food_name,
      this.food_serial,
      this.food_level,
      this.food_time,
      this.food_dtl});

  factory FoodDescTitle.fromJson(Map<String,dynamic> json){
    return FoodDescTitle(
      img_src: json['img_src'] as String,
      food_name: json['food_name'] as String,
      food_serial: json['food_serial'] as int,
      food_level: json['food_level'] as int,
      food_time: json['food_time'] as int,
      food_dtl: json['food_dtl'] as String,
    );
  }

}

class FoodDescRecipe{
  final String img_src;
  final String food_name;
  final int food_serial;
  final int food_level;
  final int food_time;
  final String recipe_dtl;

  FoodDescRecipe(
      {this.img_src,
        this.food_name,
        this.food_serial,
        this.food_level,
        this.food_time,
        this.recipe_dtl});

  factory FoodDescRecipe.fromJson(Map<String,dynamic> json){
    return FoodDescRecipe(
      img_src: json['img_src'] as String,
      food_name: json['food_name'] as String,
      food_serial: json['food_serial'] as int,
      food_level: json['food_level'] as int,
      food_time: json['food_time'] as int,
      recipe_dtl: json['food_dtl'] as String,
    );
  }

}

class FoodDescComment{
  final String email;
  final String tip;

  FoodDescComment({this.email, this.tip});

  factory FoodDescComment.fromJson(Map<String,dynamic> json){
    return FoodDescComment(
      email: json['email'] as String,
      tip: json['tip'] as String,
    );
  }
}