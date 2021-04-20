import 'package:flutter/material.dart';

class ImageCheckBox extends StatefulWidget {
  final Image beforeImage;
  final Image afterImage;
  final double size;
  final bool isChecked;
  @required
  final void Function() onPressed;
  final BorderRadiusGeometry borderRadius;

  ImageCheckBox({this.size, this.isChecked, this.onPressed,this.borderRadius, this.beforeImage, this.afterImage});
  //ImageCheckBox({this.size, this.isChecked, this.onPressed,this.borderRadius, this.beforeImage, this.AfterImage});

  @override
  _ImageCheckBoxState createState() => _ImageCheckBoxState();
}

class _ImageCheckBoxState extends State<ImageCheckBox> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
        ),
        width: widget.size ?? 50,
        height: widget.size ?? 50,
        child: widget.isChecked ? widget.afterImage : widget.beforeImage,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
