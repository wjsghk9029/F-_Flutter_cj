import 'package:flutter/material.dart';

class StringCheckBox extends StatefulWidget {
  final double width;
  final double height;
  final bool isChecked;
  final String text;
  final Color textColor;
  final double textSize;
  @required
  final bool iconAppear;
  final void Function() onPressed;
  final BorderRadiusGeometry borderRadius;

  StringCheckBox({this.width, this.height, this.isChecked, this.onPressed, this.text, this.iconAppear,
    this.borderRadius, this.textColor, this.textSize});

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
        height: widget.height ?? 20,
        child: string_apear(),
      ),
    );
  }

  string_apear() {
    if(widget.iconAppear){
      return Container(
        alignment: Alignment.center,
        child: Text(
            widget.text ?? '',
          style: TextStyle(
              color: widget.textColor ?? Colors.white,
            fontSize: widget.textSize ?? 20,
          ),
        ),
      );
    }
    return widget.isChecked ?
    Container(
      alignment: Alignment.center,
      child: Text(
          widget.text ?? '',
        style: TextStyle(
            color: widget.textColor ?? Colors.white,
          fontSize: widget.textSize ?? 20,
        ),
      ),
    ) :  null;
  }

  @override
  void initState() {
    super.initState();
  }
}
