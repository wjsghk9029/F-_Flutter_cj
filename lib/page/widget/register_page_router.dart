import 'package:flutter/material.dart';
import 'file:///C:/OfTable/oftable_flutter/lib/page/widget/page_router_circle.dart';

class PageRouterWithCircle extends StatefulWidget {
  final int pageIndex;
  final int pageViewLength;

  const PageRouterWithCircle({Key key, this.pageIndex, this.pageViewLength}) : super(key: key);
  @override
  _PageRouterWithCircleState createState() => _PageRouterWithCircleState();
}

class _PageRouterWithCircleState extends State<PageRouterWithCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.pageViewLength,
            mainAxisSpacing: 0,
            crossAxisSpacing: 2,
            childAspectRatio: 1,
          ),
          shrinkWrap: true,
          itemCount: widget.pageViewLength,
          itemBuilder: (ctx, idx){return _itemBuilder(ctx, idx);}
      ),
    );
  }

  Widget _itemBuilder(BuildContext ctx, int idx) {
    return PageRouterCircle(
      isIt: widget.pageIndex == idx,
    );
  }
}
