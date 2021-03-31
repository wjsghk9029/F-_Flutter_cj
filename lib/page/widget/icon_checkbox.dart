import 'package:flutter/material.dart';

class IconCheckBox extends StatefulWidget {
  final double size;
  final double iconSize;
  final bool isChecked;
  final Color iconColor;
  final Icon icon;
  @required
  final bool iconAppear;
  final void Function() onPressed;
  final BorderRadiusGeometry borderRadius;

  IconCheckBox({this.size, this.iconSize, this.isChecked, this.onPressed, this.iconColor, this.icon, this.iconAppear, this.borderRadius});

  @override
  _IconCheckBoxState createState() => _IconCheckBoxState();
}

class _IconCheckBoxState extends State<IconCheckBox> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
          color: widget.isChecked ? Colors.blueAccent : Colors.grey,
        ),
        width: widget.size ?? 50,
        height: widget.size ?? 50,
        child: _iconApear(),
      ),
    );
  }

  Icon _iconApear() {
    if(widget.iconAppear){
      return Icon(
        widget.icon ?? Icons.check,
        color: widget.iconColor ?? Colors.white,
        size: widget.iconSize ?? 25,
      );
    }
    return widget.isChecked ? Icon(
        widget.icon ?? Icons.check,
        color: widget.iconColor ?? Colors.white,
        size: widget.iconSize ?? 25,
      ) :  null;
  }

  @override
  void initState() {
    super.initState();
  }
}
