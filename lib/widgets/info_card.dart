// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pas_ecommerce/utils/colors/colors.dart';
import 'package:pas_ecommerce/widgets/text.dart';

class InfoCard extends StatelessWidget {
  final String title;

  final String imageUrl;
  final double height;

  const InfoCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.height, required Color textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: text(title, 20, greentitle, FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
