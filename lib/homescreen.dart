
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_ecommerce/controller/productListCTRL.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final productController = Get.put(ControllerListProduct());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Data API")),
      body: Center(
        child: Obx(() => productController.isLoading.value ? CircularProgressIndicator() : Column(
          children: [
           Text(productController.sesionUsername.value.toString()),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                itemCount: productController.productResponModelctr.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = productController.productResponModelctr[index];
                  return Container(
                    margin: EdgeInsets.all(20),
                    child: Card(
                      child: Text("Title Product : ${product.price}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),)
      ),
    );
  }
}