import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/main/controller/oh_que_page_controller.dart';
import 'package:oftable_flutter/page/main/page/widget/main_appbar.dart';
import 'package:oftable_flutter/page/main/page/widget/oh_que_list.dart';
import 'package:oftable_flutter/page/widget/tab_button.dart';

class OhQuePage extends StatelessWidget {
  final ScrollController scrollController;
  OhQuePage({
    Key key,
    this.scrollController
  }) : super(key: key);

  final OhQuePageController _ohQueController =Get.put(OhQuePageController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backGroundImage(),
        _buildBody(),
        //MainPageAppBar(),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      controller: scrollController,
      physics: ScrollPhysics(),
      child: Column(
        children: [
          MainPageAppBar(),
          Padding(padding: EdgeInsets.only(top: Get.height * 0.03)),
          _buildTabBar(),
          Padding(padding: EdgeInsets.only(top: Get.height * 0.03)),
          _buildRecommendedItems(),
          _buildList(),
        ],
      ),
    );
  }

  _buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'CURATION',
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontsUtil.poppins,
              fontSize: Get.height* 0.035,
              fontWeight: FontWeight.w800,
            ),
          ),
          GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 5,
              crossAxisCount: 2,
            ),
            itemCount: 6,
            itemBuilder: (ctx, idx) => _tabButtonItemBuilder(idx+1),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }

  Widget _tabButtonItemBuilder(int idx) {
    return Obx(()=>
        TabButton(
          onPressed: ()=>_ohQueController.changeListIdx(idx),
          notCheckColor: Colors.transparent,
          isChecked: _ohQueController.listIndex.value == idx,
          height: 10,
          child: Center(
            child: Text(
              '$idx',
              style: TextStyle(
                fontFamily: FontsUtil.korean,
                color: Colors.white
              ),
            ),
          ),
        )
    );
  }

  Widget _buildRecommendedItems() {
    return Container(
      color: Colors.blue,
      height: Get.height* 0.4,
      child: Column(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(
              color: Colors.green,
              child: Center(child: Text('1번아이템'),),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Row(
              children: [
                Flexible(
                    child: Container(
                      color: Colors.blue,
                      child: Center(child: Text('2번아이템'),),
                    )
                ),
                Flexible(
                    child: Container(
                      color: Colors.red,
                      child: Center(child: Text('3번아이템'),),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: Get.height * 0.3,
      ),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: Get.height * 0.03)),
            Text(
              'SPECIAL RECIPE',
              style: TextStyle(
                fontFamily: FontsUtil.poppins,
                fontSize: Get.height* 0.035,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.03)),
            Obx(()=>
                OhQueList(_ohQueController.listIndex.value,)
            ),
          ],
        ),
      ),
    );
  }

  Container _backGroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/background/레시피 하단 배경.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}

