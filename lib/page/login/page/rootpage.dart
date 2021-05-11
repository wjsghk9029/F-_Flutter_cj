import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/login/controller/LoginPageService.dart';
import 'package:oftable_flutter/page/login/controller/RootPageController.dart';
import 'package:oftable_flutter/page/main/main_page.dart';
import 'package:video_player/video_player.dart';

import 'loginpage.dart';


class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  RootPageController _rootPageController = Get.put(RootPageController());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage('assets/Login_background.jpg'), context);
    precacheImage(AssetImage('assets/logowithtext.png'), context);
    precacheImage(AssetImage('assets/logowithtext.png'), context);
    precacheImage(AssetImage('assets/background/레시피 하단 배경.jpg'), context);
  }

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

