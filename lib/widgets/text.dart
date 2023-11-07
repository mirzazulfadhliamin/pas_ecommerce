import 'package:flutter/material.dart';

class text extends StatelessWidget {
  var text_ = "";
  double letterspacel;
  double size = 5.0;
  var fontw = FontWeight.normal;
  var color;
  final int maxLines;
  text(
    this.text_,
    this.size,
    this.color,
    this.fontw, {
    this.letterspacel = 1,
    this.maxLines = 2,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text_,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontw,
          letterSpacing: letterspacel),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
