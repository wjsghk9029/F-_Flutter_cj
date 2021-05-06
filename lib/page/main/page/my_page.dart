import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/login/controller/LoginPageService.dart';
import 'package:oftable_flutter/page/main/page/widget/main_appbar.dart';
import 'package:oftable_flutter/page/main/page/widget/page_background_Image.dart';

class MyPage extends StatelessWidget {
  final ScrollController scrollController;
  LoginPageService _loginPageService = Get.put(LoginPageService());

  MyPage({Key key, this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageBackGroundImage(url: 'assets/register_background.jpg'),
        _buildBody(),
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainPageAppBar(),
          _buildUserInfo(),
          CupertinoButton(child: Text('로그아웃',style: TextStyle(color: Colors.white),), onPressed: ()=>_loginPageService.doLogout())
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.12),
      height: Get.height * 0.25,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: Get.height * 0.15,
                width: Get.height * 0.15,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '닉네임',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.width * 0.075,
                          fontFamily: FontsUtil.korean,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        '아이디',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.width * 0.04,
                          fontFamily: FontsUtil.korean,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info_outline,
                              size: Get.height * 0.05,
                              color: Colors.white,
                            ),
                            Text(
                                '알림',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: FontsUtil.korean,
                                fontWeight: FontWeight.w400,
                                fontSize: Get.height * 0.0225,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite_outline_sharp,
                              size: Get.height * 0.05,
                              color: Colors.white,
                            ),
                            Text(
                              '좋아요0',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: FontsUtil.korean,
                                fontWeight: FontWeight.w400,
                                fontSize: Get.height * 0.0225,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

