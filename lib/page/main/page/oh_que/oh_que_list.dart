import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    buildListView(_pageController.foodList.value.data)
    );
  }


Widget buildListView(List<TagFoodListData> data) {
  return ListView.separated(
      separatorBuilder: (ctx, idx) => Divider(),
      controller: widget.scrollController,
      itemCount: data.length,
      itemBuilder:(ctx, idx) => _buildList(data[idx]),
  );
}

_buildList(TagFoodListData data) {
  return Container(
    child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        actions: [
          IconSlideAction(
              caption: '좋아요',
              color: Colors.blue,
              icon: Icons.favorite_outlined,
              onTap: () => Get.snackbar('좋아요', '${data.food_name}이 좋아요!!')
          ),
        ],
        child: ListTile(
          leading: Container(
            color: Colors.transparent,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                minHeight: 100,
                maxWidth: 100,
                maxHeight: 100,
              ),
              child: Image.network('http://${data.img_src}', fit: BoxFit.fill,),
            ),
          ),
          title: Container(
            child: Text(data.food_name),
          ),
          subtitle: Text(data.food_description),
        )),
  );
}


}

