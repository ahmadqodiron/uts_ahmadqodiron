import 'package:flutter/material.dart';
import '../widgets/car_card.dart';
import 'profile_page.dart';

class CarListPage extends StatefulWidget {
  @override
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CarListView(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class CarListView extends StatelessWidget {
  final List<Map<String, dynamic>> cars = [
    {"name": "Opel Corsa", "price": "Rp 363.772", "image": "https://imgd.aeplcdn.com/1200x900/cw/ec/31804/Opel-Corsa-Right-Front-Three-Quarter-74706.jpg"},
    {"name": "Renault Clio", "price": "Rp 374.821", "image": "https://imgd.aeplcdn.com/1200x900/cw/ec/36610/Renault-Clio-Right-Front-Three-Quarter-74567.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pilih Mobil")),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}
