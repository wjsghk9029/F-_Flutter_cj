import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/main/controller/food_detail_page_controller.dart';
import 'package:oftable_flutter/page/main/model/food_detail.dart';
import 'package:oftable_flutter/page/main/page/widget/main_appbar.dart';

class FoodDetailPage extends GetView<FoodDetailPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx( () =>
        controller.isSettingDone.isTrue
          ? GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                Container(
                  height: Get.height * 0.55 + MediaQuery.of(context).padding.top,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('${controller.foodDetailTitle.value.img_src}'),
                        fit: BoxFit.cover,
                        alignment: Alignment.center
                    )
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                _buildBody(),
              ],
            ),
          )
          : Padding(
          padding: EdgeInsets.only(top: Get.height * 0.1),
          child: SpinKitRing(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Material(
      color: Colors.transparent,
      borderOnForeground: false,
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainPageAppBar(isNotMainPage: true,),
            Padding(padding: EdgeInsets.all(5)),
            _buildTitle(),
            Padding(padding: EdgeInsets.all(Get.height * 0.01)),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
              ),
                child: _buildRecipe()
            ),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/레시피 하단 배경.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: _buildTip(),
            )
          ],
        ),
      ),
    );
  }


  _buildTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: ()=>Get.back(),
              iconSize: Get.height * 0.045,
            ),
          ),
          Text(
            '${controller.foodDetailTitle.value.food_name}',
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontUtil.korean,
              fontWeight: FontWeight.w800,
              fontSize: Get.height * 0.055
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            height: Get.height * 0.09,
            decoration: BoxDecoration(
              border: Border.symmetric(horizontal: BorderSide(width: 2.5, color: Colors.white))
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            '${controller.foodDetailTitle.value.food_time}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontUtil.korean,
                            fontWeight: FontWeight.w800,
                            fontSize: Get.height * 0.025
                          ),
                        ),
                        Text(
                          'min',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: FontUtil.korean,
                              fontWeight: FontWeight.w500,
                              fontSize: Get.height * 0.015
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.symmetric(vertical: BorderSide(color: Colors.white))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${controller.foodDetailTitle.value.food_level}',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: FontUtil.korean,
                                fontWeight: FontWeight.w800,
                                fontSize: Get.height * 0.025
                            ),
                          ),
                          Text(
                            'level',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: FontUtil.korean,
                                fontWeight: FontWeight.w500,
                                fontSize: Get.height * 0.015
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.privacy_tip_outlined, color: Colors.white,),
                      onPressed: (){},
                      iconSize: Get.height * 0.04,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.favorite_border_sharp, color: Colors.white,),
                      onPressed: (){},
                      iconSize: Get.height * 0.04,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(15)),
          Text(
            '${controller.foodDetailTitle.value.food_dtl}',
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontUtil.korean,
              fontSize: Get.height * 0.03,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipe() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  '재료',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: Get.width * 0.06
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  '재료 설명',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width * 0.04
                  ),
                ),
                Padding(padding: EdgeInsets.all(15)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(15)),
          Container(
            alignment: Alignment.center,
            child: Text(
              '레시피',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: Get.width * 0.06
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(15)),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.foodDetailRecipe.length,
              itemBuilder: (ctx, idx)=>_buildRecipeListItem(controller.foodDetailRecipe.elementAt(idx)),
          ),
        ],
      ),
    );
  }

  _buildRecipeListItem(FoodDetailRecipe item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: Get.height * 0.15,
                maxHeight: Get.height * 0.15,
                minWidth: Get.width * 0.4,
                maxWidth: Get.width * 0.4,
              ),
              child: Image.network('${item.img_src}', fit: BoxFit.fill,),
            ),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.topLeft,
            child: Text(
              '${item.recipe_dtl}',
              style: TextStyle(
                color: Colors.black,
                fontFamily: FontUtil.korean,
                fontSize: Get.height * 0.022
              ),
            ),
          ))
        ],
      ),
    );
  }

  _buildTip() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _recommendProduct(),
          _tip(),
        ],
      ),
    );
  }

  _recommendProduct() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '관련상품',
            style: TextStyle(
                color: Colors.black,
                fontFamily: FontUtil.korean,
                fontWeight: FontWeight.w900,
                fontSize: Get.width * 0.08
            ),
          ),
          Padding(padding: EdgeInsets.all(15)),
          Text('관련상품')
        ],
      ),
    );
  }

  _tip() {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TIP',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontUtil.korean,
                          fontWeight: FontWeight.w900,
                          fontSize: Get.width * 0.08
                      ),
                    ),
                    Expanded(child: Container(
                      alignment: Alignment.bottomRight,
                      child: CupertinoButton(
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.zero,
                        onPressed: (){},
                        child: Text(
                            '더보기+',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Get.width * 0.04,
                            fontFamily: FontUtil.korean,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  '닉네임',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Get.width * 0.045,
                    fontFamily: FontUtil.korean,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      flex : 4,
                      child: Container(
                        height: Get.height * 0.05,
                        child: TextField(
                          controller: controller.tipEditingController,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Get.width * 0.04,
                            fontFamily: FontUtil.korean,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.zero,
                              gapPadding: 4
                            ),
                            contentPadding: EdgeInsets.only(left: 5),
                            hintText: '마이 TIP 남기기',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: Get.width * 0.04,
                              fontFamily: FontUtil.korean,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Flexible(child: Container(
                      height: Get.height * 0.05,
                      child: MaterialButton(
                        hoverElevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        color: Colors.black26,
                        onPressed: (){},
                        child: Text(
                          '등록',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Get.width * 0.04,
                            fontFamily: FontUtil.korean,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: controller.foodDetailComment.length,
              itemBuilder: (ctx, idx) => _buildTipListItem(controller.foodDetailComment.elementAt(idx)),
              separatorBuilder: (BuildContext context, int index) => _separatotTip(),
            ),
          ),
        ],
      ),
    );
  }

  Container _separatotTip() => Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.black87)
    ),
  );

  _buildTipListItem(FoodDetailComment item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '${item.email}',
            style: TextStyle(
              color: Colors.black,
              fontSize: Get.width * 0.04,
              fontFamily: FontUtil.korean,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            '${item.tip}',
            style: TextStyle(
              color: Colors.black,
              fontSize: Get.width * 0.045,
              fontFamily: FontUtil.korean,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

}
