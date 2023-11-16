import 'package:flutter/material.dart';
import 'package:pas_ecommerce/provider/auth.dart';
import 'package:pas_ecommerce/utils/colors/colors.dart';
import 'package:pas_ecommerce/widgets/profile_avatar';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Autth>(context, listen: false);
    return Scaffold(
      backgroundColor: db1_dark_blue,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileAvatar(),
              const SizedBox(height: 20),
              const Text(
                'ZOlfa',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const Text(
                'zolrrrr@gmail.com',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 40),
              CustomButton(
                icon: Icons.settings,
                label: 'Account Settings',
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              CustomButton(
                icon: Icons.public,
                label: 'Language',
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              CustomButton(
                icon: Icons.delete,
                label: 'Clear Cache',
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              CustomButton(
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
}
