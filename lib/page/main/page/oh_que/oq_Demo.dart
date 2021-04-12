import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/model/tag_food_list.dart';

class OqDemo extends StatefulWidget {
  final TagFoodListData listData;
  const OqDemo({Key key, this.listData}) : super(key: key);
  @override
  _OqDemoState createState() => _OqDemoState();
}

class _OqDemoState extends State<OqDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:Get.height * 0.05, right: Get.width * 0.05, left: Get.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'DemoTag${widget.listData.food_serial}',
              child: Image.network('http://${widget.listData.img_src}', fit: BoxFit.cover, height: Get.height * 0.4, width: Get.width,),
            ),
            Text('${widget.listData.food_name}', style: TextStyle(fontSize: Get.height * 0.05),),
            Text('${widget.listData.food_description}', style: TextStyle(fontSize: Get.height * 0.05),),
          ],
        ),
      ),
    );
  }
}
