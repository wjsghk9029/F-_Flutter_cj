import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberInfo extends StatefulWidget {
  @override
  _MemberInfoState createState() => _MemberInfoState();
}

class _MemberInfoState extends State<MemberInfo> {
  final idTextFieldController = TextEditingController();
  final pwTextFieldController = TextEditingController();
  final pwReTextFieldController = TextEditingController();
  final nameTextFieldController = TextEditingController();
  final birthDayTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();
  final phoneAuthTextFieldController = TextEditingController();
  final homeNameTextFieldController = TextEditingController();
  final homePhoneTextFieldController = TextEditingController();
  final homeAdressTextFieldController = TextEditingController();

  @override
  void dispose() {
    idTextFieldController.dispose();
    pwTextFieldController.dispose();
    pwReTextFieldController.dispose();
    nameTextFieldController.dispose();
    birthDayTextFieldController.dispose();
    emailTextFieldController.dispose();
    phoneTextFieldController.dispose();
    phoneAuthTextFieldController.dispose();
    homeNameTextFieldController.dispose();
    homePhoneTextFieldController.dispose();
    homeAdressTextFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGroundImage(),
          _AppBar(),
        ],
      ),
    );
  }

  Positioned _AppBar() {
    return Positioned(
          width: Get.width,
          child: AppBar(
            shape: Border(bottom: BorderSide(color: Colors.white, width: 0.75)),
            toolbarHeight: Get.height * 0.075,
            elevation: 0,
            shadowColor: Colors.white,
            backgroundColor: Colors.transparent,
            title: Container(
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/상단로고.png',
                fit: BoxFit.cover,
                height: Get.height * 0.05,),
            ),
            automaticallyImplyLeading: false,
          ),
        );
  }

  Container backGroundImage() {
    return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/register_background.jpg'), fit: BoxFit.fill),
          ),
        );
  }

}
