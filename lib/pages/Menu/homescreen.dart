import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_ecommerce/pages/card/provider.dart';
import 'package:pas_ecommerce/provider/api/ControllerListProduct.dart';
import 'package:pas_ecommerce/provider/home.dart';

import 'package:pas_ecommerce/utils/colors/colors.dart';
import 'package:pas_ecommerce/widgets/card.dart';
import 'package:pas_ecommerce/widgets/container.dart';
import 'package:pas_ecommerce/widgets/info_card.dart';
import 'package:pas_ecommerce/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/api/ControllerListProduct.dart';
import '../../controller/api/productListCTRL.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final productController = Get.put(ControllerListProduct());
  final barang = Get.put(ProductListCrl());

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double tinggi = size.height / 4;
    double containerSize = MediaQuery.of(context).size.width * 0.3;


    return Consumer3<HomeProvider , ProductData , CardProvider>(
        builder: (context, home, product, card, child) {

          return Scaffold(
              appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 253, 170, 93),
                  title: Text("Welcome to Kenzol"),
                  actions: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        IconButton(
                          onPressed: () {

                          },
                          icon: Icon(Icons.shopping_cart),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 13,
                          child: Container(
                            padding: EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ]),
              body: SingleChildScrollView(
                child: product.isLoadingData
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: const TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: db1_box,
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          home.setActiveIndex(index);
                        },
                        autoPlay: true,
                        enlargeCenterPage: true,
                        height: tinggi,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration:
                        Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeFactor: 0.2,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        final carouselSlider =
                        product.products[index];
                        return InfoCard(
                          textColor: db1_white,
                          title: carouselSlider.title,
                          imageUrl: carouselSlider.thumbnail,
                          height: 150,
                        );
                      },
                    ),
                    buildIndicator(
                      activeIndex: home.activeIndex,
                      totalCount: 5,
                    ),
                    SizedBox(
                      height: containerSize,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: product.products.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          final categories =
                          product.products[index];
                          return CustomContainer(
                            borderRadius: 10,
                            color: Color.fromARGB(255, 253, 170, 93),
                            widthPercent: 0.3,
                            heightPercent: 0.3,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                  child: Image.network(
                                    categories.thumbnail,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                text(categories.title, 10, Colors.black,
                                    FontWeight.bold),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.5,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: product.products.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final productt =
                        product.products[index];
                        return ShoppingItem(
                          onTap:  () {
                            card.addProduct(context , productt);
                          },
                          rating: productt.rating,
                          title: productt.title,
                          description: productt.description,
                          image: productt.thumbnail,
                          price: double.parse("${productt.price}"),
                        );
                      },
                    ),
                    Text(productController.sesionUsername.value.toString()),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: barang.productResponModelctr.length,
                        itemBuilder: (BuildContext context, int index) {
                          final products =
                          productController.productResponModelctr[index];
                          return Container(
                            margin: EdgeInsets.all(20),
                            child: Card(
                              child: Column(
                                children: [
                                  Text("Title Product : ${products.title}"),
                                  Text("price : ${products.price}"),
                                  Image.network('${products.thumbnail}')
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    )
                  ],
                ),
              ));
        }
        );
  }

  Widget buildIndicator({required int activeIndex, required int totalCount}) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: totalCount,
      effect: ExpandingDotsEffect(
        dotWidth: 8,
        dotHeight: 8,
        activeDotColor: Color.fromARGB(255, 253, 170, 93),
      ),
    );
  }
}
