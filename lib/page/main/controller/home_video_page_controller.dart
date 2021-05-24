import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/model/home_page_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomeVideoPageController extends GetxController{
  final HomPageDataVideo _dataVideo;
  YoutubePlayerController playerController = YoutubePlayerController();

  HomeVideoPageController(this._dataVideo);

  RxBool isLoading = true.obs;
  RxBool showPlayer = true.obs;
  String getVideoDetail() => _dataVideo.video_dtl;

  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    playerController = YoutubePlayerController(
      initialVideoId: _dataVideo.video_num,
      params: YoutubePlayerParams(
      interfaceLanguage: 'ko',
      showControls: true,
      showFullscreenButton: true,
      )
    );
    isLoading(false);
  }

  @override
  void onClose() {
    playerController.stop();
    showPlayer(false);
    playerController.close();
    super.onClose();
  }
}
