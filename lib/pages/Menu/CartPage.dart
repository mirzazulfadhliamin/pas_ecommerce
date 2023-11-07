import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return Container(
            child: ListTile(
              leading: Image.asset(game.imagePath),
              title: Text(
                game.name,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "${game.genre} ${game.price}",
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
              trailing: Text(
                "${game.rating}",
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
            ),
          );
        },
      ),
    );
  }
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
