import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/oh_que_page_controller.dart';
import 'package:oftable_flutter/page/main/model/tag_food_list.dart';

class OhQueList extends StatefulWidget {
  final ScrollController scrollController;
  final int listIdx;

  const OhQueList({this.scrollController, this.listIdx});
  @override
  _OhQueListState createState() => _OhQueListState();
}

class _OhQueListState extends State<OhQueList> {
  OhQuePageController _pageController =Get.put(OhQuePageController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.getTagFoodList(widget.listIdx);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
    _pageController.isLoading.value ?
    Center(child: Text('로딩중')) :
    Container(
      padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
        child: buildListView(_pageController.foodList.value.data))
    );
  }


Widget buildListView(List<TagFoodListData> data) {
  return ListView.builder(
      controller: widget.scrollController,
      itemCount: data.length,
      itemBuilder:(ctx, idx) => _buildList(data[idx]),
  );
}

_buildList(TagFoodListData data) {
  return Container(
    child: Container(
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            color: Colors.transparent,
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
          ],
        ),
      )
    ),
  );
}
  // ListTile(
  // leading: Container(
  // color: Colors.transparent,
  // child: ConstrainedBox(
  // constraints: BoxConstraints(
  // minWidth: Get.width * 0.4,
  // minHeight: Get.height * 0.6,
  // maxWidth: Get.width * 0.4,
  // maxHeight: Get.height * 0.6,
  // ),
  // child: Image.network('http://${data.img_src}', fit: BoxFit.fill,),
  // ),
  // ),
  // title: Container(
  // child: Text(data.food_name),
  // ),
  // subtitle: Text(data.food_description),
  // ),

}

