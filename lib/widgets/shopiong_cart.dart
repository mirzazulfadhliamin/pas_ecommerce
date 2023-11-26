import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pas_ecommerce/models/cart_model.dart';
import 'package:pas_ecommerce/pages/card/provider.dart';
import 'package:pas_ecommerce/widgets/text.dart';
import 'package:provider/provider.dart';

import '../utils/colors/colors.dart';


class ShoppingCartItemWidget extends StatelessWidget {
  final cartModel product;

  ShoppingCartItemWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.black),
              image: DecorationImage(
                image: NetworkImage(product.thumbnail),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? "",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                  text("${product.rating ?? 0.0}", 10, db1_grey, FontWeight.normal),
                    RatingBarIndicator(
                      rating: product.rating ?? 0.0,
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
                SizedBox(height: 4.0),
               text( product.description ?? "", 10, db2_black, FontWeight.w500),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        cardProvider.decreaseQuantity(context, product);
                      },
                      style: ElevatedButton.styleFrom(
                      minimumSize: Size(10.0, 15.0),
                        primary: Colors.red,
                      ),
                      child: Icon(Icons.remove, color: Colors.white , size: 10,),
                    ),
                    SizedBox(width: 8.0),
                    Text('${product.quantity}'),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        cardProvider.increaseQuantity( context, product);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(10.0, 15.0),
                        primary: Colors.green,
                      ),
                      child: Icon(Icons.add, color: Colors.white , size: 10,),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Sisa Stok: ${product.stock - product.quantity}",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
       

        ],
      ),
    );
  }
}
