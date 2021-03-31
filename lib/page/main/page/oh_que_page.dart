import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/oh_que_page_controller.dart';
import 'package:oftable_flutter/page/main/model/tag_food_list.dart';
import 'package:oftable_flutter/page/widget/register_page_router.dart';

class OhQuePage extends StatefulWidget {
  final ScrollController scrollController;
  const OhQuePage({this.scrollController});
  @override
  _OhQuePageState createState() => _OhQuePageState();
}

class _OhQuePageState extends State<OhQuePage> {
  // ignore: non_constant_identifier_names
  OhQuePageController _pageController;
  PageController _bannerController;
  int _bannerPageNum = 0;

  @override
  void initState() {
    _pageController = Get.put(OhQuePageController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx((){
      var data = _pageController.foodList.value.data;
      return Container(
        child: _pageController.isLoading.value ?
            Center(child: Text('로딩중')) :
            ListView.separated(
              separatorBuilder: (ctx, idx) => Divider(),
                controller: widget.scrollController,
                itemCount: data.length,
                itemBuilder: (ctx, idx) => idx == 0 ? _buildBanner() : _buildList(data[idx])),
      );
    });
  }

  _buildList(TagFoodListData data) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Container(
        child: Container(
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
      ),
    );
  }

  _buildBanner() {
    return Stack(
      children: [
        Container(
          height: 75,
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 40,
            child: PageRouterWithCircle(
              pageViewLength: 5,
              pageIndex: _bannerPageNum,
            ),
          ),
        ),
        Container(
          color: Colors.black12,
          child: LimitedBox(
            maxHeight: 75,
            child: PageView.builder(
              onPageChanged: (idx){
                setState(() {
                  _bannerPageNum = idx;
                });
              },
              controller: _bannerController,
              itemCount: 5,
              itemBuilder: (ctx, idx) => Center(
                child: Text('$idx'),
              ),)
          ),
        ),
      ],
    );
  }
}
