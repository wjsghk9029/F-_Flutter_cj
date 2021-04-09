import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/login/controller/LoginPageService.dart';
import 'package:oftable_flutter/page/main/controller/oh_que_page_controller.dart';
import 'package:oftable_flutter/page/main/model/tag_food_list.dart';
import 'package:oftable_flutter/page/main/page/oh_que_page.dart';
import 'package:oftable_flutter/page/widget/tab_button.dart';


class OhQueList extends StatefulWidget {
  final ScrollController scrollController;

  final int listIdx;

  const OhQueList({this.scrollController, this.listIdx});
  @override
  _OhQueListState createState() => _OhQueListState();
}
class _OhQueListState extends State<OhQueList> {
  OhQuePageController _ohQueController =Get.put(OhQuePageController());
  LoginPageService _loginPageService =Get.put(LoginPageService());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ohQueController.getTagFoodList(widget.listIdx);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
    _ohQueController.isLoading.value ?
    Center(child: Text('로딩중')) :
    Container(
      padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
        child: buildListView(_ohQueController.foodList.value.data))
    );
  }


Widget buildListView(List<TagFoodListData> data) {
  return ListView.builder(
      controller: widget.scrollController,
      itemCount: data.length +1,
      itemBuilder:(ctx, idx) => idx == 0 ?
          _buildTabBar():
          _buildList(data[idx-1]),
  );
}

_buildList(TagFoodListData data) {
  return Container(
    height: Get.height * 0.25,
    child: Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: Get.height * 0.25,
                  minHeight: Get.height * 0.25,
                  maxWidth: Get.height * 0.25,
                  maxHeight: Get.height * 0.25,
              ),
               child: Image.network('http://${data.img_src}', fit: BoxFit.cover,),
             ),
            ),
            GestureDetector(
              onTap: () async {
                try{
                  await _ohQueController.postFoodLike(_loginPageService.accessToken.value, data.food_serial) ?
                  Get.snackbar('좋아요', data.food_name) :
                  Get.defaultDialog(title: '에러', middleText: 'postFoodLike');
                }catch(ex){
                  Get.defaultDialog(title: '에러', middleText: ex.toString());
                }
              },
              child: Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                color: Colors.black,
                width: Get.height * 0.05,
                height: Get.height * 0.05,
                child: Icon(Icons.favorite, color: ColorsUtil.hibiscusPink,),
              ),
            ),
          ],
        ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(data.food_description, style: TextStyle(fontSize: Get.height * 0.02, fontFamily: FontsUtil.nanumGothic)),
                Padding(padding: EdgeInsets.all(Get.height * 0.01)),
                Text(data.food_name, style: TextStyle(fontSize: Get.height * 0.04, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800,)),
              ],
            ),
          )
        ],
      ),
    )
  );
}

  _buildTabBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(child: Text('CURATION', style: TextStyle(fontSize: Get.height *0.025, fontFamily: FontsUtil.poppins),)),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 2.5,
            maxCrossAxisExtent: Get.width * 0.3,
          ),
          itemCount: 7,
          itemBuilder: (ctx, idx) => _tabButtonItemBuilder(idx),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        ),
      ],
    );
  }

  _tabButtonItemBuilder(int idx) {
    return TabButton(
      notCheckColor: Colors.transparent,
      height: 10,
      isChecked: OhQuePage.pageController.page == idx ?? false,
      child: Center(
        child: Text(
          '$idx',
          style: TextStyle(
            fontFamily: FontsUtil.nanumGothic,
          ),
        ),
      ),
      onPressed: () => OhQuePage.pageController.jumpToPage(idx),
    );
  }
}

