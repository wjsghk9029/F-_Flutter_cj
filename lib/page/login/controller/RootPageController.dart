import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class RootPageController extends GetxController{
  var videoController = VideoPlayerController.asset("assets/rootLoading.mp4").obs;
  var videoInitializeDone = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    var _vc = videoController.value;
    await _vc.initialize();
    _vc.setLooping(false);
    _vc.setVolume(0.0);
    _vc.play();
    videoInitializeDone(true);
  }


  @override
  void onClose() {
    super.onClose();
    videoController.value.dispose();
  }



}
