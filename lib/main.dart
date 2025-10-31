import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/form_page.dart';
import 'pages/car_list_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(RentalMobilApp());
}

class RentalMobilApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental Mobil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: SplashScreen(),
      routes: {
        '/form': (context) => FormPage(),
        '/cars': (context) => CarListPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
