import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pas_ecommerce/models/cart_model.dart';
import 'package:pas_ecommerce/utils/colors/colors.dart';
import 'package:pas_ecommerce/widgets/shopiong_cart.dart';
import 'package:pas_ecommerce/widgets/text.dart';
import 'package:provider/provider.dart';

import '../../models/BarangResponseModel.dart';
import 'provider.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Consumer<CardProvider>(
        builder: (context, cardProvider, child) {
          return
            cardProvider.cartItems.length == 0 ? Center(child: text("your shopping basket is still empty" , 12 , db1_grey, FontWeight.w500)):  ListView.builder(
              itemCount: cardProvider.cartItems.length,
              itemBuilder: (context, index) {
                cartModel product = cardProvider.cartItems[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    extentRatio: 0.2,
                    children: [
                      SlidableAction(
                        label: 'Delete',
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        onPressed: (context) => cardProvider.removeProduct(context, product),

                      ),
                    ],
                  ),
                  child: ShoppingCartItemWidget(product: product ).animate().fade(duration: 200.ms).slideX(
                    begin: 100.0,
                  ),
                );
              },
            );;

        },
      ),

    );
  }}


