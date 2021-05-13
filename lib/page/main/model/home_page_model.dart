// ignore_for_file: non_constant_identifier_names

class HomePageModel {
  final String apikey;
  final int error;
  final String type;
  final HomePageData data;

  HomePageModel({this.apikey, this.error, this.type, this.data});

  factory HomePageModel.fromJson(Map<String, dynamic> json){
    return HomePageModel(
      apikey: json['apikey'] as String,
      error: json['error'] as int,
      type: json['type'] as String,
      data: HomePageData.formJson(json['data']),
    );
  }
}

class HomePageData {
  final List<HomPageDataBanner> banner;
  final List<HomPageDataProduct> product;
  final List<HomPageDataVideo> video;

  HomePageData({this.banner, this.product, this.video});

  factory HomePageData.formJson(Map<String, dynamic> json){
    return HomePageData(
      banner: (json['banner'] as List).map((e) => HomPageDataBanner.fromJson(e)).toList(),
      product: (json['product'] as List).map((e) => HomPageDataProduct.fromJson(e)).toList(),
      video: (json['video'] as List).map((e) => HomPageDataVideo.fromJson(e)).toList(),
    );
  }

}
class HomPageDataBanner {
  final String img_src;
  final String banner_dtl;

  HomPageDataBanner({this.img_src, this.banner_dtl});
  factory HomPageDataBanner.fromJson(Map<String, dynamic> json){
    return HomPageDataBanner(
      img_src: json['img_src'] as String,
      banner_dtl: json['banner_dtl'] as String,
    );
  }
}

class HomPageDataProduct {
  final String img_src;
  final String food_name;
  final int food_serial;

  HomPageDataProduct({this.img_src, this.food_name, this.food_serial});
  factory HomPageDataProduct.fromJson(Map<String, dynamic> json){
    return HomPageDataProduct(
      img_src: json['img_src'] as String,
      food_name: json['food_name'] as String,
      food_serial: json['food_serial'] as int,
    );
  }

}

class HomPageDataVideo {
  final String video_num;
  final String video_dtl;

  HomPageDataVideo({this.video_num, this.video_dtl});
  factory HomPageDataVideo.fromJson(Map<String, dynamic> json){
    return HomPageDataVideo(
      video_num: json['video_num'] as String,
      video_dtl: json['video_dtl'] as String,
    );
  }
}



