import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<bool> itemChecked = List.generate(10, (index) => false);
  List<int> itemQuantity = List.generate(10, (index) => 1);
  List<double> itemPrices = List.generate(10, (index) => 19.99);
  List<double> itemRatings = List.generate(10, (index) => 4.5); // Rating item, sesuaikan sesuai kebutuhan
  int notificationCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 239, 243),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 253, 170, 93),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Wishlist',
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                    Spacer(),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Icon(Icons.shopping_cart, color: Colors.white),
                        Positioned(
                          bottom: 8,
                          child: Container(
                            padding: EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Text(
                              notificationCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 8.0),
                    Icon(Icons.notifications, color: Colors.white),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'Alamat Pengiriman',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Panorama Kos, Besito, Jawa Tengah',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 253, 170, 93)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    // Aksi yang ingin Anda lakukan ketika nilai search berubah
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            itemChecked[index] = !itemChecked[index];
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Colors.black),
                            color: itemChecked[index]
                                ? Color.fromARGB(255, 253, 170, 93)
                                : Colors.white,
                          ),
                          child: Center(
                            child: itemChecked[index]
                                ? Icon(Icons.check, size: 12.0, color: Colors.white)
                                : null,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Item ${index + 1}',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Deskripsi item ${index + 1}',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Price: \$${itemPrices[index].toStringAsFixed(2)}',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 8.0),
                          // RatingBar.builder(
                          //   initialRating: itemRatings[index],
                          //   minRating: 1,
                          //   direction: Axis.horizontal,
                          //   allowHalfRating: true,
                          //   itemCount: 5,
                          //   itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          //   itemBuilder: (context, _) => Icon(
                          //     Icons.star,
                          //     color: Colors.amber,
                          //     size: 1, // Ukuran ikon bintang
                          //   ),
                          //   onRatingUpdate: (rating) {
                          //     // Aksi yang ingin Anda lakukan ketika rating berubah
                          //   },
                          // ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, size: 16.0),
                            onPressed: () {
                              setState(() {
                                if (itemQuantity[index] > 1) {
                                  itemQuantity[index]--;
                                }
                              });
                            },
                          ),
                          Text('${itemQuantity[index]}'),
                          IconButton(
                            icon: Icon(Icons.add, size: 16.0),
                            onPressed: () {
                              setState(() {
                                itemQuantity[index]++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
