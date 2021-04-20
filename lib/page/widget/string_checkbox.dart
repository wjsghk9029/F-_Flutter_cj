import 'package:flutter/material.dart';

class StringCheckBox extends StatefulWidget {
  final bool isChecked;
  final Text text;
  @required
  final bool iconAppear;
  final void Function() onPressed;
  final BorderRadiusGeometry borderRadius;

  StringCheckBox({this.isChecked, this.onPressed, this.text, this.iconAppear,
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
          color: widget.isChecked ? Colors.white : Colors.transparent,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
          border: Border.all(color: Colors.white,),
        ),
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
