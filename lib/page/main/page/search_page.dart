import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/main/controller/bottom_navi_service.dart';
import 'package:oftable_flutter/page/main/controller/search_page_controller.dart';
import 'package:oftable_flutter/page/main/page/widget/page_background_Image.dart';

class SearchPage extends StatelessWidget {
  final BottomNaviService _naviService = Get.find();
  final TextEditingController searchInputController = TextEditingController();
  final SearchPageController _searchPageController = Get.put(SearchPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children: [
            PageBackGroundImage(url: 'assets/register_background.jpg',),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          _buildContent(),
        ],
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
                          color: Colors.white,
                          fontSize: Get.width* 0.04,
                        ),
                        controller: searchInputController,
                        onSubmitted: (val)=>_searchPageController.onSubmit(val),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: Icon(Icons.search_sharp, color: Colors.white,),
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

  _buildContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.zero,
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: ()=>Get.back(),
            iconSize: Get.height * 0.045,
          ),
          Padding(padding: EdgeInsets.all(Get.height*0.01)),
          _localItems(),
          Padding(padding: EdgeInsets.all(Get.height*0.075)),
          _recommendItems()
        ],
      ),
    );
  }

  _localItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '최근 검색어',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontUtil.korean,
                    fontWeight: FontWeight.w800,
                    fontSize: Get.height * 0.035
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                height: Get.height * 0.05,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text('모두 지우기',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontUtil.korean,
                    fontSize: Get.height * 0.017,
                  ),),
                  minSize: Get.height * 0.02,
                  onPressed: ()=>_searchPageController.resetLocalItems(),
                ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(5)),
        Obx(()=>
            Wrap(
          spacing: 15,
            runSpacing: 10,
            alignment: WrapAlignment.start,
          children: _searchPageController.localItems.map((e) => _buildItem(e)).toList(),
        ))
      ],
    );
  }

  Material _buildItem(String text) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: ()=>_searchPageController.onSubmit(text),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white54),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: FontUtil.korean,
                fontWeight: FontWeight.w500,
                fontSize: Get.height * 0.022
              ),
            ),
          ),
        ),
      ),
    );
  }

  _recommendItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '추천 검색어',
            style: TextStyle(
                color: Colors.white,
                fontFamily: FontUtil.korean,
                fontWeight: FontWeight.w800,
                fontSize: Get.height * 0.035
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(5)),
        Obx(()=>
            Wrap(
              spacing: 15,
              runSpacing: 10,
              alignment: WrapAlignment.start,
              children: _searchPageController.recommendItems.map((e) => _buildItem(e)).toList(),
            ))
      ],
    );
  }


}
