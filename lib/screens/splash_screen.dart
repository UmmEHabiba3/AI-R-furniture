import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // 🖼️ Background Image (FULL SCREEN)
          SizedBox.expand(
            child: Image.asset(
              "assets/images/splash.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // 📝 Text
          Positioned(
            bottom: 120,
            left: 20,
            right: 20,
            child: Text(
              "Find The Best Furniture For Your Room",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // ⭕ Circular Arrow Button
          Positioned(
            bottom: 40,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.brown),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
