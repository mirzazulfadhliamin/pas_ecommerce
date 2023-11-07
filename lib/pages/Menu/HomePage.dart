import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'image/banner.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1B1B1B),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: Colors.white.withOpacity(0.75)),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.75)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                CategoryItem(
                  image: 'image/banner.png',
                  text: 'New',
                  icon: Icons.new_releases,
                  onPressed: () {
                    // Tambahkan kode yang ingin dijalankan saat Category 1 ditekan
                  },
                ),
                CategoryItem(
                  image: 'image/banner.png',
                  text: 'Special',
                  icon: Icons.local_offer,
                  onPressed: () {
                    // Tambahkan kode yang ingin dijalankan saat Category 2 ditekan
                  },
                ),
                CategoryItem(
                  image: 'image/banner.png',
                  text: 'Populer',
                  icon: Icons.trending_up,
                  onPressed: () {
                    // Tambahkan kode yang ingin dijalankan saat Category 3 ditekan
                  },
                ),
                CategoryItem(
                  image: 'image/banner.png',
                  text: 'Free',
                  icon: Icons.free_breakfast,
                  onPressed: () {
                    // Tambahkan kode yang ingin dijalankan saat Category 4 ditekan
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String image;
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  CategoryItem({
    required this.image,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.white.withOpacity(0.5)),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white.withOpacity(0.75),
                    size: 32,
                  ),
                  SizedBox(height: 8),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
