import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/login/controller/LoginPageService.dart';
import 'package:oftable_flutter/page/main/controller/oh_que_page_controller.dart';
import 'package:oftable_flutter/page/main/model/tag_food_list.dart';
import 'file:///C:/OfTable/oftable_flutter/lib/page/main/page/wiget/oq_Demo.dart';
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
    height: Get.width * 0.3,
    child: GestureDetector(
      onTap: ()=>Get.to(OqDemo(listData: data,)),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Hero(
            tag: 'DemoTag${data.food_serial}',
            child: Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: Get.width * 0.3,
                  minHeight: Get.width * 0.3,
                  maxWidth: Get.width * 0.3,
                  maxHeight: Get.width * 0.3,
              ),
               child: Image.network('http://${data.img_src}', fit: BoxFit.cover,),
             ),
            ),
          ), 
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              data.food_name,
                              style: TextStyle(
                                fontSize: Get.height * 0.025,
                                fontFamily: FontsUtil.korean,
                                fontWeight: FontWeight.w800,
                              )
                          ),
                          Text(data.food_description,
                              style: TextStyle(
                                  fontSize: Get.height * 0.015,
                                  fontFamily: FontsUtil.korean
                              )
                          ),
                        ],
                      ),
                      flex: 3,
                    ),
                    Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(top: BorderSide(width: 0.75))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  '${data.food_time}',
                                  style: TextStyle(
                                      fontSize: Get.height * 0.025,
                                      fontFamily: FontsUtil.poppins,
                                      color: Colors.black)
                              ),
                              Text(
                                  'min',
                                  style: TextStyle(
                                      fontSize: Get.height * 0.015,
                                      fontFamily: FontsUtil.poppins,
                                      color: Colors.black)
                              ),
                              Padding(padding: EdgeInsets.only(right: 10)),
                              Text(
                                  '${data.food_level}',
                                  style: TextStyle(
                                      fontSize: Get.height * 0.025,
                                      fontFamily: FontsUtil.poppins,
                                      color: Colors.black)
                              ),
                              Text(
                                  'level',
                                  style: TextStyle(
                                      fontSize: Get.height * 0.015,
                                      fontFamily: FontsUtil.poppins,
                                      color: Colors.black)
                              ),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  iconSize: Get.height * 0.025,
                                  onPressed: (){},
                                  icon: Icon(Icons.favorite_border, size: Get.height * 0.025,)
                              )
                            ],
                          ),
                        ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
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
            fontFamily: FontsUtil.korean,
          ),
        ),
      ),
      onPressed: () => OhQuePage.pageController.jumpToPage(idx),
    );
  }
}

