import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/controller/root_page_controller.dart';
import 'package:video_player/video_player.dart';

class RootPage extends StatelessWidget {
  final RootPageController _rootPageController = Get.put(RootPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    var _controller = _rootPageController.videoController.value;
    return Obx(()=>SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size?.width ?? Get.width,
          height: _controller.value.size?.height ?? Get.height,
          child: _rootPageController.videoInitializeDone.value ? VideoPlayer(_controller) : Image.asset('assets/splash_demo.jpg'),
        ),
      ),
    )
    );
  }
}

