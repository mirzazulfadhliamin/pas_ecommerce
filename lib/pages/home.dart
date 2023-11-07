
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_ecommerce/controller/home/homebinding.dart';
import 'package:pas_ecommerce/controller/home/homectrl.dart';
import 'package:pas_ecommerce/utils/colors/colors.dart';
import 'package:pas_ecommerce/widgets/text.dart';

import 'package:get/get.dart';
import 'package:pas_ecommerce/controller/productListCTRL.dart';
import 'package:provider/provider.dart';
import '../provider/auth.dart';

class HomePages extends GetView<HomeBinding> {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final double tinggi = size.height / 4;
    double containerSize = MediaQuery.of(context).size.width * 0.3;
    return Scaffold(
      backgroundColor: db1_white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   padding: EdgeInsets.only(left: 10, right: 10, top: 40),
            //   child: Row(
            //     children: [
            //       text(title, 18, title_color, FontWeight.bold),
            //       Expanded(
            //         child: SizedBox(),
            //       ),
            //       text(
            //         language,
            //         12,
            //         db2_black,
            //         FontWeight.normal,
            //       ),
            //       Icon(Icons.keyboard_arrow_down_sharp),
            //       CircleAvatar(
            //         backgroundColor: bg_lonceng,
            //         child: Icon(
            //           Icons.notifications,
            //           color: lonceng,
            //         ),
            //         radius: 16,
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(children: [
            //     CircleAvatar(
            //       radius: 20,
            //       backgroundColor: bgicon,
            //       child: Icon(
            //         Icons.location_on_outlined,
            //         color: db1_white,
            //       ),
            //     ),
            //     SizedBox(
            //       width: 5,
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         text(city, 10, text_color, FontWeight.normal),
            //         text(cityy, 12, text_color, FontWeight.normal)
            //       ],
            //     ),
            //     Expanded(child: SizedBox()),
            //     Icon(
            //       Icons.arrow_forward_ios_sharp,
            //       size: 20,
            //     ),
            //     SizedBox(
            //       width: 20,
            //     )
            //   ]),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: search,
            //       hintStyle: TextStyle(fontWeight: FontWeight.normal),
            //       filled: true,
            //       fillColor: bg_search,
            //       contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            //       prefixIcon: const Icon(Icons.search),
            //       suffixIcon: Tooltip(
            //         message: 'mic',
            //         child: IconButton(
            //           onPressed: () {},
            //           icon: const Icon(
            //             Icons.mic_none,
            //             color: bgicon,
            //           ),
            //         ),
            //       ),
            //       border: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // CarouselSlider(
            //   options: CarouselOptions(
            //     autoPlay: true,
            //     enlargeCenterPage: true,
            //     height: tinggi,
            //     autoPlayInterval: Duration(seconds: 3),
            //     autoPlayAnimationDuration: Duration(milliseconds: 800),
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //     enlargeFactor: 0.2,
            //     scrollDirection: Axis.horizontal,
            //   ),
            //   items: popular.map((Popular i) {
            //     return Builder(
            //       builder: (BuildContext context) {
            //         return InfoCard(
            //             title: i.nama, imageUrl: i.image, height: 150);
            //       },
            //     );
            //   }).toList(),
            // ),
            // SizedBox(height: 20.0),
            // Container(
            //     padding: EdgeInsets.only(left: 10),
            //     child: text(categori, 16, db2_black, FontWeight.bold)),
            // SizedBox(height: 10.0),
            // SizedBox(
            //   height: containerSize,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     itemCount: categories.length,
            //     itemBuilder: (BuildContext ctxt, int index) {
            //       int bgColorIndex = index % 4;
            //       return CustomContainer(
            //           borderRadius: 10,
            //           color: bgColors[bgColorIndex],
            //           widthPercent: 0.3,
            //           heightPercent: 0.3,
            //           child: Column(
            //             children: [
            //               SizedBox(
            //                 height: 30,
            //               ),
            //               Expanded(
            //                 child: Image.asset(
            //                   categories[index].image,
            //                 ),
            //               ),
            //               Expanded(child: SizedBox()),
            //               text(categories[index].nama, 10, db1_white,
            //                   FontWeight.bold),
            //               SizedBox(
            //                 height: 20,
            //               )
            //             ],
            //           ));
            //     },
            //   ),
            // ),
            // SizedBox(height: 10),
            // Container(
            //     margin: EdgeInsets.only(left: 10),
            //     child: text(populardeals, 16, db2_black, FontWeight.bold)),
            // GridView.builder(
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     childAspectRatio: 0.5,
            //   ),
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: shopItems.length,
            //   itemBuilder: (BuildContext ctxt, int index) => ShoppingItem(
            //     title: shopItems[index].title,
            //     description: shopItems[index].description,
            //     image: shopItems[index].image,
            //     price: shopItems[index].price,
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            Obx(
        () => ControllerListProduct().isLoading.value
            ? CircularProgressIndicator()
            : Column(
                children: [
                  Text(ControllerListProduct().sesionUsername.value.toString()),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      itemCount: ControllerListProduct().productResponModelctr.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product =
                            ControllerListProduct().productResponModelctr[index];
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
              ),
      )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        color: db1_white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home_filled,
                color: nv,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: nv,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: nv,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: nv,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: ClipOval(
        child: Material(
          color: Colors.white,
          child: ClipOval(
            child: Material(
              color: Colors.orange,
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child:
                      Icon(Icons.shopping_cart, color: db1_white), // Icon color
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: false,
    );
  }
}
