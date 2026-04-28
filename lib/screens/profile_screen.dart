import 'package:flutter/material.dart';
import 'auth_storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Georgia',
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // AVATAR
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),

            const SizedBox(height: 16),

            // NAME
            Text(
              savedName.isEmpty ? "No Name Found" : savedName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 6),

            // EMAIL
            Text(
              savedEmail.isEmpty ? "No Email Found" : savedEmail,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white54,
              ),
            ),

            const SizedBox(height: 30),

            // MENU ITEMS
            _menuItem(Icons.shopping_bag_outlined, "My Orders", context),
            _menuItem(Icons.location_on_outlined, "My Address", context,
                route: '/address'),
            _menuItem(Icons.shopping_cart_outlined, "My Cart", context,
                route: '/cart'),

            // ABOUT
            _menuItem(Icons.info_outline, "About", context, onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: const Text(
                    "About Al-R Furniture",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: const Text(
                    "We provide premium furniture for modern homes. "
                    "Sofas, tables, chairs, beds & more with fast delivery.",
                    style: TextStyle(height: 1.5),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Close"),
                    ),
                  ],
                ),
              );
            }),

            // ✅ CONTACT US — /form pe le jata hai
            _menuItem(Icons.contact_support_outlined, "Contact Us", context,
                route: '/form'),

            const SizedBox(height: 30),

            // LOGOUT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  savedName = "";
                  savedEmail = "";
                  savedPassword = "";
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                child: const Text(
                  "LOGOUT",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(
    IconData icon,
    String title,
    BuildContext context, {
    String? route,
    VoidCallback? onTap,
  }) {
    return Card(
      color: const Color(0xFF2C2C2C),
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 14, color: Colors.white54),
        onTap: onTap ??
            () {
              if (route != null) {
                Navigator.pushNamed(context, route);
              }
            },
      ),
    );
  }
}