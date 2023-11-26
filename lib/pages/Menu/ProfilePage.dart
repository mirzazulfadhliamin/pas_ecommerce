import 'package:flutter/material.dart';
import 'package:pas_ecommerce/provider/auth.dart';
import 'package:pas_ecommerce/utils/colors/colors.dart';
import 'package:pas_ecommerce/widgets/profile_avatar.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Autth>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileAvatar(),
              const SizedBox(height: 20),
              Text(
                'ZOlfa',
                style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'zolrrrr@gmail.com',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              const SizedBox(height: 40),
              buildProfileButton(
                icon: Icons.settings,
                label: 'Account Settings',
                onPressed: () {
                  // Tambahkan aksi saat tombol ditekan
                },
              ),
              const SizedBox(height: 16),
              buildProfileButton(
                icon: Icons.public,
                label: 'Language',
                onPressed: () {
                  // Tambahkan aksi saat tombol ditekan
                },
              ),
              const SizedBox(height: 16),
              buildProfileButton(
                icon: Icons.delete,
                label: 'Clear Cache',
                onPressed: () {
                  // Tambahkan aksi saat tombol ditekan
                },
              ),
              const SizedBox(height: 16),
              buildProfileButton(
                icon: Icons.logout,
                label: 'Log Out',
                onPressed: () {
                  auth.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileButton({required IconData icon, required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: 200,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 253, 170, 93), // Warna latar belakang tombol
          onPrimary: Colors.white, // Warna teks tombol
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
