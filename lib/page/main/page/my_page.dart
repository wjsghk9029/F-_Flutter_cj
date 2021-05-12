import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/main/controller/mypage_controller.dart';
import 'package:oftable_flutter/page/main/page/widget/main_appbar.dart';
import 'package:oftable_flutter/page/main/page/widget/page_background_Image.dart';

class MyPage extends StatelessWidget {
  final ScrollController scrollController;
  final MyPageController _myPageController = Get.put(MyPageController());

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
      controller: scrollController,
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainPageAppBar(),
          _buildUserInfo(),
          _buildList('나의 쇼핑', _myPageController.shoppingItems),
          Padding(padding: EdgeInsets.all(Get.height * 0.01)),
          _buildList('나의 계정설정', _myPageController.accountItems),
          Padding(padding: EdgeInsets.all(Get.height * 0.01)),
          _buildList('서비스', _myPageController.serviceItems),
          Padding(padding: EdgeInsets.all(Get.height * 0.03)),
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
                          fontFamily: FontUtil.korean,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        '아이디',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.width * 0.04,
                          fontFamily: FontUtil.korean,
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
                                fontFamily: FontUtil.korean,
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
                                fontFamily: FontUtil.korean,
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

  Widget _buildList(String title, RxList<MyPageListItem> myPageListItems) {
    return Obx(()=>
        Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 5),
            width: Get.width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.white,
                )
              )
            ),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontUtil.korean,
                  fontWeight: FontWeight.w300,
                  fontSize: Get.height * 0.02,
                ),
              ),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: myPageListItems.length,
            itemBuilder: (ctx, idx) => _buildListItem(myPageListItems.elementAt(idx)),
          ),
        ],
      ),
    ));
  }

  Widget _buildListItem(MyPageListItem myPageListItem) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        onTap: myPageListItem.onTap,
        title: Text(
          myPageListItem.listText,
          style: TextStyle(
            color: Colors.white,
            fontFamily: FontUtil.korean,
            fontSize: Get.height * 0.025,
            fontWeight: FontWeight.w800
          ),
        ),

      ),
    );
  }
}

