import 'package:flutter/material.dart';

@Deprecated(
    '회원가입 페이지에서만 사용됨'
)
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
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.pageViewLength,
            crossAxisSpacing: 10,
            childAspectRatio: 5,
          ),
          shrinkWrap: true,
          itemCount: widget.pageViewLength,
          itemBuilder: (ctx, idx){return _itemBuilder(ctx, idx);}
      ),
    );
  }

  Widget _itemBuilder(BuildContext ctx, int idx) {
    bool isIt = widget.pageIndex == idx;
    return Container(
      color: isIt ? Colors.white : Colors.white60,
    );
  }
}
