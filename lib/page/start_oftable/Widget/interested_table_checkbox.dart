import 'package:flutter/material.dart';

class InterestedCheckBox extends StatefulWidget {
  final double size;
  final double iconSize;
  final bool isChecked;
  void Function() onPressed;

  InterestedCheckBox({this.size, this.iconSize, this.isChecked, this.onPressed});

  @override
  _InterestedCheckBoxState createState() => _InterestedCheckBoxState();
}

class _InterestedCheckBoxState extends State<InterestedCheckBox> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: widget.isChecked ? Colors.blueAccent : Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
        width: widget.size ?? 50,
        height: widget.size ?? 50,
        child: widget.isChecked ? Icon(
          Icons.check,
          color: Colors.white,
          size: widget.iconSize ?? 25,
        ) :  null,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
