import 'package:flutter/material.dart';

class StringCheckBox extends StatefulWidget {
  final double width;
  final double height;
  final bool isChecked;
  final Text text;
  @required
  final bool iconAppear;
  final void Function() onPressed;
  final BorderRadiusGeometry borderRadius;

  StringCheckBox({this.width, this.height, this.isChecked, this.onPressed, this.text, this.iconAppear,
    this.borderRadius});

  @override
  _StringCheckBoxState createState() => _StringCheckBoxState();
}

class _StringCheckBoxState extends State<StringCheckBox> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: widget.isChecked ? Colors.blueAccent : Colors.grey,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
        ),
        width: widget.width ?? 50,
        height: widget.height ?? 50,
        child: _stringApear(),
      ),
    );
  }

  _stringApear() {
    if(widget.iconAppear){
      return Container(
        alignment: Alignment.center,
        child: widget.text,
      );
    }
    return widget.isChecked ?
    Center(
      child: Container(
        alignment: Alignment.center,
        child: widget.text,
      ),
    ) :  null;
  }
}
