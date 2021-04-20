import 'package:flutter/material.dart';

class PageRouterCircle extends StatefulWidget {
  final bool isIt;

  const PageRouterCircle({this.isIt});
  @override
  _PageRouterCircleState createState() => _PageRouterCircleState();
}

class _PageRouterCircleState extends State<PageRouterCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.isIt ? Colors.white : Colors.white60,
    );
  }
}
