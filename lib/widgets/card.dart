import 'package:flutter/material.dart';
import 'package:pas_ecommerce/provider/api/ControllerListProduct.dart';
import 'package:pas_ecommerce/widgets/text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pas_ecommerce/utils/colors/colors.dart';
import 'package:provider/provider.dart';

import '../pages/card/provider.dart';

class ShoppingItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final double price;
  final bool isLiked;
  final double rating;
  final VoidCallback onTap;

  ShoppingItem({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
    this.image = "assets/BG.jpg",
    this.price = 12,
    this.isLiked = true,
    this.rating = 4.5,
  });

  @override
  Widget build(BuildContext context) {


    double screenWidth = MediaQuery.of(context).size.width;


    double imageHeight = screenWidth * 0.5;

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  image,
                  width: double.infinity,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(
                  title,
                  16,
                  db2_black,
                  FontWeight.bold,
                ),
                SizedBox(height: 4),
                text(
                  description,
                  11,
                  db2_black,
                  FontWeight.normal,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child:   Row(
              children: [
                text("${rating ?? 0.0}", 10, db1_grey, FontWeight.normal),
                RatingBarIndicator(
                  rating: rating ?? 0.0,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(width: 5),

              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    primary: db1_green,
                  ),
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: text(
                  "\$${price}",
                  16,
                  db1_green,
                  FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
