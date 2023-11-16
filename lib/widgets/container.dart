
import 'package:flutter/material.dart';
import 'package:pas_ecommerce/utils/colors/colors.dart';

class CustomContainer extends StatelessWidget {
  final double widthPercent;
  final double heightPercent;
  final Widget child;
  final Color color;
  final double borderRadius;

  CustomContainer({
    Key? key,
    required this.widthPercent,
    required this.heightPercent,
    required this.child,
    this.color = db1_dark_blue,
    this.borderRadius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * widthPercent;
    double containerHeight = MediaQuery.of(context).size.height * heightPercent;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: color, 
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
