import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/register/Widget/page_router_circle.dart';

class RegisterPageRouter extends StatefulWidget {
  final int pageIndex;
  final int pageViewLength;

  const RegisterPageRouter({Key key, this.pageIndex, this.pageViewLength}) : super(key: key);
  @override
  _RegisterPageRouterState createState() => _RegisterPageRouterState();
}

class _RegisterPageRouterState extends State<RegisterPageRouter> {
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
