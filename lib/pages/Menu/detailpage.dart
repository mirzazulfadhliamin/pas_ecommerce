import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> product = Get.arguments;

    double rating = product['rating'] != null ? product['rating']['rate'] ?? 0.0 : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        backgroundColor: Colors.orange, // Sesuaikan dengan warna tema Anda
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  // Tambahkan aksi yang ingin dilakukan saat tombol keranjang ditekan
                },
                icon: Icon(Icons.shopping_cart),
              ),
              Positioned(
                bottom: 30,
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
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  // Tambahkan aksi yang ingin dilakukan saat tombol notifikasi ditekan
                },
                icon: Icon(Icons.notifications),
              ),
              Positioned(
                bottom: 10,
                right: 10,
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
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Tambahkan aksi yang ingin dilakukan saat tombol hati ditekan
                },
                icon: Icon(Icons.favorite_border), // Ikon hati belum disukai
              ),
             
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'product_image_${product['id']}', // Tag unik untuk Hero
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(product['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          product['title'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Tambahkan aksi yang ingin dilakukan saat tombol hati ditekan
                              },
                              icon: Icon(Icons.favorite_border), // Ikon hati belum disukai
                            ),
                            SizedBox(width: 8),
                            IconButton(
                              onPressed: () {
                                // Tambahkan aksi yang ingin dilakukan saat tombol share ditekan
                              },
                              icon: Icon(Icons.share),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (newRating) {
                        // Tindakan yang diambil ketika rating diperbarui
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      product['description'],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Price: \$${product['price']}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                         Get.toNamed('/paymentPage');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange, // Sesuaikan dengan warna tema Anda
                        minimumSize: Size(double.infinity, 50), // Menyesuaikan tinggi tombol
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
