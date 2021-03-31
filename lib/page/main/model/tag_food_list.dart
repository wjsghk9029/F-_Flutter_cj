class TagFoodList {
  final String apikey;
  final int error;
  final String type;
  final List<TagFoodListData> data;

  TagFoodList({this.apikey, this.error, this.type, this.data});

  factory TagFoodList.fromJson(Map<String, dynamic> json) {
    return TagFoodList(
      apikey: json['apikey'] as String,
      error: json['error'] as int,
      type: json['type'] as String,
      data: (json['data'] as List).map((e) => TagFoodListData.fromJson(e)).toList(),
    );
  }
}

class TagFoodListData{
 // ignore: non_constant_identifier_names
 final String img_src;
 // ignore: non_constant_identifier_names
 final String food_description;
 // ignore: non_constant_identifier_names
 final int food_price;
 // ignore: non_constant_identifier_names
 final String food_name;
 // ignore: non_constant_identifier_names
 final int food_serial;

  // ignore: non_constant_identifier_names
  TagFoodListData({this.img_src, this.food_description, this.food_price, this.food_name, this.food_serial});

 factory TagFoodListData.fromJson(Map<String, dynamic> json) {
   return TagFoodListData(
     img_src: json['img_src']as String,
     food_description: json['food_description']as String,
     food_price: json['food_price']as int,
     food_name: json['food_name']as String,
     food_serial: json['food_serial']as int,
   );
 }
}


// {
// "apikey":"3155438468483",
// "error":0,
// "type":"json",
// "data":[
// {
// "img_src":"172.16.37.187:8080/images/1_test_1.png",
// "food_description":"돈까스라는 음식",
// "food_price":10000,
// "food_name":"fork",
// "food_serial":1
// },