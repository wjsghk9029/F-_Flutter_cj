import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/main/controller/oh_que_page_controller.dart';
import 'package:oftable_flutter/page/main/model/tag_food_list.dart';
import 'package:oftable_flutter/page/main/page/binding/food_detail_binding.dart';
import 'package:oftable_flutter/page/main/page/food_detail_page.dart';
import 'package:oftable_flutter/page/main/page/widget/main_appbar.dart';
import 'package:oftable_flutter/page/main/page/widget/oh_que_list.dart';
import 'package:oftable_flutter/page/main/page/widget/page_background_Image.dart';
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
        PageBackGroundImage(url: 'assets/background/레시피 하단 배경.jpg'),
        _buildBody(),
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
          Obx(() => _buildRecommendedItems(_ohQueController.foodList.value.data)),
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
              fontFamily: FontUtil.poppins,
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
                fontFamily: FontUtil.korean,
                color: Colors.white
              ),
            ),
          ),
        )
    );
  }

  Widget _buildRecommendedItems(TagFoodData data) {
    return Obx( () =>
        Container(
      color: Colors.white,
      height: Get.height* 0.45,
      child: _ohQueController.isRecommendLoading.value
          ? SpinKitRing(color: Colors.blue)
          : _recommendedItemsColumn(data),
    ));
  }

  Column _recommendedItemsColumn(TagFoodData data) {
    return Column(
      children: [
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: _recommendedItem(data.recommend_list[0], titleFontSize: Get.height * 0.045, subTitleNumberFontSize: Get.height * 0.03, subTitleTextFontSize: Get.height * 0.02),
        ),
        Flexible(
          flex: 4,
          fit: FlexFit.loose,
          child: Row(
            children: [
              Flexible(
                  child: _recommendedItem(data.recommend_list[1])
              ),
              Flexible(
                  child: _recommendedItem(data.recommend_list[2])
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _recommendedItem (TagFoodRecommendListData data, {double titleFontSize, double subTitleNumberFontSize, double subTitleTextFontSize}){
    return GestureDetector(
      onTap: ()=> Get.to(FoodDetailPage(), binding: FoodDetailBinding(data.food_serial)),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(data.img_src),
          )
        ),
        child: Container(
            color: Colors.black.withOpacity(0.2),
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Container(
                      child: Text(
                        '${data.food_name}',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontUtil.korean,
                          fontWeight: FontWeight.w800,
                          fontSize: titleFontSize ?? Get.height * 0.03,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(width: 1, color: Colors.white.withOpacity(0.5)))
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                      Text(
                      '${data.food_time}',
                          style: TextStyle(
                              fontSize: subTitleNumberFontSize ?? Get.height * 0.023,
                              fontFamily: FontUtil.poppins,
                              color: Colors.white)
                      ),
                      Text(
                          ' min',
                          style: TextStyle(
                              fontSize: Get.height * 0.015,
                              fontFamily: FontUtil.poppins,
                              color: Colors.white)
                      ),
                      Padding(padding: EdgeInsets.only(right: 10)),
                      Text(
                          '${data.food_level}',
                          style: TextStyle(
                              fontSize: subTitleNumberFontSize ?? Get.height * 0.023,
                              fontFamily: FontUtil.poppins,
                              color: Colors.white)
                      ),
                      Text(
                          ' level',
                          style: TextStyle(
                              fontSize: Get.height * 0.015,
                              fontFamily: FontUtil.poppins,
                              color: Colors.white)
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: subTitleNumberFontSize ?? Get.height * 0.03,
                          onPressed: (){},
                          icon: Icon(Icons.favorite_border, size: subTitleNumberFontSize ?? Get.height * 0.03, color: Colors.white,)
                      ),
                    ]),
                  )
                )
                ],
              ),
            )
        ),
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
                fontFamily: FontUtil.poppins,
                fontSize: Get.height* 0.035,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: Get.height * 0.03)),
            OhQueList(_ohQueController.listIndex.value,),
          ],
        ),
      ),
    );
  }
}

