import 'package:flutter/material.dart';
import 'package:pas_ecommerce/models/cart_model.dart';


import '../../models/BarangResponseModel.dart';

import 'package:flutter/foundation.dart';


class CardProvider extends ChangeNotifier {

  List<cartModel> cartItems = [];

  void addProduct(BuildContext context, Product product) {
    try {
      var existingCartItem = cartItems.firstWhere((item) => item.id == product.id);
      existingCartItem.quantity += 1;
      showSnackbar(context, 'Quantity updated for ${product.title}');
    } catch (e) {
      print('Item not found: $e');
      cartItems.add(
        cartModel(
          id: product.id,
          title: product.title,
          description: product.description,
          price: product.price,
          discountPercentage: product.discountPercentage,
          rating: product.rating,
          stock: product.stock,
          brand: product.brand,
          category: product.category,
          thumbnail: product.thumbnail,
          images: product.images,
          quantity: 1,
        ),
      );
      notifyListeners();
      showSnackbar(context, '${product.title} added to the cart');
    }
  }

  void increaseQuantity(BuildContext context, cartModel cartItem) {
    cartItem.quantity += 1;
    notifyListeners();
    //showSnackbar(context, 'Quantity updated for ${cartItem.title}');
  }

  void decreaseQuantity(BuildContext context, cartModel cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity -= 1;
      notifyListeners();
      //showSnackbar(context, 'Quantity updated for ${cartItem.title}');
    } else {
      removeProduct(context, cartItem);
    }
  }

  void removeProduct(BuildContext context, cartModel cartItem) {
    cartItems.remove(cartItem);
    notifyListeners();
    showSnackbar(context, '${cartItem.title} removed from the cart');
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  }











