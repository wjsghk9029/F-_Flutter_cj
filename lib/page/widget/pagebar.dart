import 'package:flutter/material.dart';

class CustomPageBar extends StatelessWidget {
  final int nowIndex;
  final int pageViewLength;
  final double width;
  final double height;

  const CustomPageBar({Key key, this.nowIndex, this.pageViewLength, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: pageViewLength,
            crossAxisSpacing: 10,
            childAspectRatio: 5,
          ),
          shrinkWrap: true,
          itemCount: pageViewLength,
          itemBuilder: (ctx, idx)=>_itemBuilder(ctx, idx),
      ),
    );
  }

  Widget _itemBuilder(BuildContext ctx, int idx) {
    bool isIt = nowIndex == idx;
    return Container(
      color: isIt ? Colors.white : Colors.white60,
    );
  }
}
