import 'package:flutter/material.dart';

class TabButton extends StatefulWidget {
  final double height;
  final double width;
  final Color checkedColor;
  final Color notCheckColor;
  @required final void Function() onPressed;
  @required final Widget child;
  @required final bool isChecked;

  const TabButton({this.height, this.width, this.isChecked, this.checkedColor, this.notCheckColor, this.onPressed, this.child});
  @override
  _TabButtonState createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        height: widget.height ?? null,
        width: widget.width ?? null,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: widget.isChecked? Border(bottom: BorderSide(color: Colors.white, width: 1)) : Border(bottom: BorderSide.none),
        ),
        child: widget.child,
      ),
    );
  }
}
