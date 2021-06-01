import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/main/controller/bottom_navi_service.dart';
import 'package:oftable_flutter/page/main/controller/search_result_controller.dart';
import 'package:oftable_flutter/page/main/page/widget/oh_que_list.dart';
import 'package:oftable_flutter/page/main/page/widget/page_background_Image.dart';

class SearchResultPage extends GetView<SearchResultController> {
  final BottomNaviService _naviService = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              PageBackGroundImage(url: 'assets/register_background.jpg',),
              _buildBody(),
            ],
          )
      ),
    );
  }

  _buildHeader() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: Get.context.mediaQueryPadding.top)),
        Container(
          height: Get.height * 0.075,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.white, width: 0.75
                  )
              )
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: GestureDetector(
                      onTap:()=>_naviService.changeIndex(2, true),
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset('assets/상단로고.png',
                          fit: BoxFit.fitHeight,
                          height: Get.height * 0.045,
                        ),
                      ),
                    )
                ),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 7,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 5),
                      height: Get.height * 0.05,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                          fontFamily: FontUtil.korean,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: Get.width* 0.04,
                        ),
                        controller: controller.searchInputController,
                        onSubmitted: (val)=>{},
                        decoration: InputDecoration(
                          suffixIconConstraints: BoxConstraints(
                            maxHeight: Get.width * 0.05,
                            maxWidth: Get.width * 0.05,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: ()=>controller.searchInputController.clear(),
                            child: Container(
                              margin: EdgeInsets.only(right: 5),
                              child: CircleAvatar(
                                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                                child: Center(child: Icon(Icons.clear, size: Get.width * 0.03, color: Colors.blueAccent,)),
                              ),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(style: BorderStyle.none),
                              gapPadding: 0,
                              borderRadius: BorderRadius.all(Radius.circular(100))
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(75, 255, 255, 255),
                          hintStyle: TextStyle(
                            fontFamily: FontUtil.korean,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            gapPadding: 0,
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                          ),
                        ),
                      ),
                    )
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      height: Get.height * 0.045,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.favorite_border_sharp,
                        color: Colors.white,
                      ),
                    )
                )
              ],
            ),
          ),
        )
      ],
    );

  }

  Widget _buildBody() {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildMenu(),
          Padding(padding: EdgeInsets.all(10)),
          _buildList(),
        ],
      ),
    );
  }

  _buildMenu() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.025),
            child: IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: ()=>Get.back(),
              iconSize: Get.height * 0.045,
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'SHOP',
                      style: TextStyle(
                        fontFamily: FontUtil.national_park_outline,
                        fontSize: Get.width* 0.065,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.symmetric(vertical: BorderSide(color: Colors.white)),
                    ),
                    child: Text(
                      'CURATION',
                      style: TextStyle(
                        fontFamily: FontUtil.poppins,
                        fontWeight: FontWeight.w800,
                        fontSize: Get.width* 0.065,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'MAGAZINE',
                      style: TextStyle(
                        fontFamily: FontUtil.national_park_outline,
                        fontSize: Get.width* 0.065,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => controller.isSettingDone.value 
                    ? Text(
                    '전체 ${controller.data.data.length}',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontUtil.korean,
                    fontSize: Get.width * 0.04
                  ),
                )
                  : SpinKitRing(color: Colors.white, size: 10, lineWidth: 3,)),
                Expanded(child: Container(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.3))),
                      onPressed: (){},
                      icon: Icon(Icons.arrow_drop_down, color: Colors.white,),
                      label: Text('판매순', style: TextStyle(color: Colors.white))
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildList() {
    return Container(
      width: Get.width,
      color: Colors.white.withOpacity(0.35),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Obx(()=> OhQueList(
        data: controller.data.data,
        isLoading: controller.isSettingDone.isFalse,
        onPressFavorite: (foodSn, foodLike){},
      )
      ),
    );
  }

}
