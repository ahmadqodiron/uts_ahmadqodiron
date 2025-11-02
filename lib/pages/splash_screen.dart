import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // 🔹 Animasi logo membesar halus
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();

    // 🔹 Navigasi otomatis ke halaman berikut
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/form');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 🔹 Background gradasi merah elegan
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF4B2B), Color(0xFFFF416C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // 🔹 Konten utama (logo + teks)
          FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.directions_car_rounded,
                  color: Colors.white,
                  size: 100,
                ),
                SizedBox(height: 20),
                Text(
                  "YanAra",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Sewa Mobil Mudah & Cepat",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Loading animasi di bawah
          Positioned(
            bottom: 40,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 3,
            ),
          ),
        ],
      ),
    );
  }
}
