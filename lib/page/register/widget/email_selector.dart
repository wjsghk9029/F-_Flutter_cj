import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';

class EmailSelector extends StatelessWidget {
  final List<EmailSelectorItem> items;

  const EmailSelector(this.items, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.5,
      height: Get.height * 0.25,
      child: ListView.builder(
          itemBuilder: (ctx, idx) => _buildItem(items[idx]),
        itemCount: items.length,
      ),
    );
  }

  Widget _buildItem(EmailSelectorItem item) {
    return ListTile(
      title: Text(item.emailText),
      onTap: ()=>Get.back(result: item.emailText),
    );
  }
}
