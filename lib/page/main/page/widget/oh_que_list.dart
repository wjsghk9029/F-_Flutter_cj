import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/Util.dart';
import 'package:oftable_flutter/page/main/controller/oh_que_page_controller.dart';
import 'package:oftable_flutter/page/main/model/tag_food_list.dart';
import 'package:oftable_flutter/page/main/page/binding/food_detail_binding.dart';
import 'package:oftable_flutter/page/main/page/food_detail_page.dart';


class OhQueList extends StatelessWidget {
  final int listIdx;
  OhQueList(this.listIdx);
  final OhQuePageController _ohQueController =Get.put(OhQuePageController());
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
    _ohQueController.isLoading.value ?
    Center(child: SpinKitRing(color: Colors.blue,)) :
    buildListView(_ohQueController.foodList.value.data)
    );
  }


  Widget buildListView(TagFoodData data) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
        itemCount: data.food_list.length,
        itemBuilder:(ctx, idx) => _buildList(data.food_list[idx]),
    );
  }


  _buildList(TagFoodListData data) {
    return Container(
      height: Get.width * 0.3,
      child: GestureDetector(
        onTap: ()=> Get.to(FoodDetailPage(), binding: FoodDetailBinding(data.food_serial)),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 5),
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
                 child: Image.network(data.img_src, fit: BoxFit.cover,),
               ),
              ),
            ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 15),
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
                                  fontFamily: FontUtil.korean,
                                  fontWeight: FontWeight.w800,
                                )
                            ),
                            Text(data.food_description,
                                style: TextStyle(
                                    fontSize: Get.height * 0.015,
                                    fontFamily: FontUtil.korean,
                                    fontWeight: FontWeight.w600,
                                )
                            ),
                          ],
                        ),
                        flex: 3,
                      ),
                      Flexible(
                        flex: 1,
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
                                        fontFamily: FontUtil.poppins,
                                        color: Colors.black)
                                ),
                                Text(
                                    'min',
                                    style: TextStyle(
                                        fontSize: Get.height * 0.015,
                                        fontFamily: FontUtil.poppins,
                                        color: Colors.black)
                                ),
                                Padding(padding: EdgeInsets.only(right: 10)),
                                Text(
                                    '${data.food_level}',
                                    style: TextStyle(
                                        fontSize: Get.height * 0.025,
                                        fontFamily: FontUtil.poppins,
                                        color: Colors.black)
                                ),
                                Text(
                                    'level',
                                    style: TextStyle(
                                        fontSize: Get.height * 0.015,
                                        fontFamily: FontUtil.poppins,
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

}

