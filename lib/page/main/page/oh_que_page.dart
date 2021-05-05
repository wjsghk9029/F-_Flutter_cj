import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/main/controller/oh_que_page_controller.dart';
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
    return _buildBody();
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTabBar(),
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
              fontFamily: FontsUtil.poppins,
              fontSize: Get.height* 0.035,
              fontWeight: FontWeight.w800,
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 5,
              crossAxisCount: 2,
            ),
            itemCount: 6,
            itemBuilder: (ctx, idx) => _tabButtonItemBuilder(idx),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }

  _tabButtonItemBuilder(int idx) {
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
              ),
            ),
          ),
        )
    );
  }
}

