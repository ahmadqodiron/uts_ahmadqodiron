import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/form_page.dart';
import 'pages/car_list_page.dart';
import 'pages/profile_page.dart';
import 'pages/payment_page.dart';
import 'pages/chat_page.dart';


void main() {
  runApp(const RentalMobilApp());
}

class RentalMobilApp extends StatelessWidget {
  const RentalMobilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental Mobil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const SplashScreen(),
      routes: {
        '/form': (context) => const FormPage(),
        '/cars': (context) => const CarListPage(),
        '/profile': (context) => const ProfilePage(),
        '/payment': (context) => PaymentPage(),
        '/chat': (context) => const ChatPage(),
      },
    );
  }
}
