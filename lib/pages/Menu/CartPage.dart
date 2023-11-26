import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'History',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 4.0),
            Text(
              'Transaksi yang sudah kamu lakukan',
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Stack(
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
                      '3',
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
            onPressed: () {
              // Aksi ketika tombol keranjang ditekan
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Aksi ketika tombol notifikasi ditekan
            },
          ),
        ],
        backgroundColor: Color.fromARGB(255, 253, 170, 93),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: purchases.length,
        itemBuilder: (context, index) {
          final purchase = purchases[index];
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
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: Image.asset(purchase.game.imagePath),
              title: Text(
                purchase.game.name,
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.0),
                  Text(
                    "${purchase.game.genre} ${purchase.game.price}",
                    style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Purchase Date: ${purchase.purchaseDate.toString()}',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
              trailing: Text(
                "${purchase.game.rating}",
                style: TextStyle(color: Colors.black.withOpacity(0.8)),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Purchase {
  final Game game;
  final DateTime purchaseDate;

  Purchase({required this.game, required this.purchaseDate});
}

class Game {
  final String name;
  final String genre;
  final String price;
  final double rating;
  final String imagePath;

  Game({
    required this.name,
    required this.genre,
    required this.rating,
    required this.price,
    required this.imagePath,
  });
}

final games = [
  Game(name: "PUBG2", genre: "Open World · FPS", rating: 4.0, price: "Free", imagePath: 'assets/splash 3.png'),
  Game(name: "Stumble Guys", genre: "Parkour · Multiplayer", rating: 3.9, price: "Free", imagePath: 'assets/splash 3.png'),
  Game(name: "Girls' Connect: Idle RPG", genre: "Idle · Gacha", rating: 4.2, price: "Rp 100.000,00", imagePath: 'assets/splash 3.png'),
];

final purchases = [
  Purchase(game: games[0], purchaseDate: DateTime(2023, 11, 17)),
  Purchase(game: games[1], purchaseDate: DateTime(2023, 11, 16)),
  Purchase(game: games[2], purchaseDate: DateTime(2023, 11, 15)),
];
