import 'package:flutter/material.dart';

class PageBackGroundImage extends StatelessWidget {
  final String url;

  const PageBackGroundImage({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
      ),
    );
  }
}
