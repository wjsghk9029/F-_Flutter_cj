import 'package:flutter/material.dart';

class AutoLoginCheckBox extends StatefulWidget {
  final void Function() onPressed;
  final bool isChecked;
  final Icon icon;
  final Color iconColor;
  final double iconSize;
  final double height;
  final double width;
  final Text text;

  AutoLoginCheckBox({this.onPressed, this.icon, this.iconColor, this.iconSize,
    this.isChecked, this.height, this.width, this.text});

  @override
  _AutoLoginCheckBoxState createState() => _AutoLoginCheckBoxState();
}

class _AutoLoginCheckBoxState extends State<AutoLoginCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: widget.isChecked ? Colors.blueAccent : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
         height: widget.height ?? 33,
        width: widget.width ?? (widget.isChecked ? 145 : 120),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isChecked ? Container(
              child: Icon(
                widget.icon ?? Icons.check,
                color: widget.iconColor ?? Colors.white,
                size: widget.iconSize ?? 25,
              ),
            ) :  Padding(padding: EdgeInsets.zero,),
            Container(
              child: widget.text ?? Text('자동로그인',
                style: TextStyle(
                  color: widget.isChecked ? Colors.white : Colors.lightBlue,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
