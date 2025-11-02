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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class CarListView extends StatelessWidget {
  final List<Map<String, dynamic>> cars = [
    {
      "name": "Opel Corsa",
      "category": "Ekonomi",
      "price": "Rp 363.772",
      "location": "In terminal • CDG",
      "policy": "Kebijakan BBM adil",
      "image": "https://cdn.imagin.studio/getImage?customer=img&make=opel&model=corsa&angle=23&zoomType=fullscreen"
    },
    {
      "name": "Renault Clio",
      "category": "Ekonomi",
      "price": "Rp 374.821",
      "location": "Shuttle • ORY",
      "policy": "Kebijakan BBM adil",
      "image": "https://cdn.imagin.studio/getImage?customer=img&make=renault&model=clio&angle=23&zoomType=fullscreen"
    },
    {
      "name": "Toyota Yaris",
      "category": "Kompat",
      "price": "Rp 410.000",
      "location": "Bandara • CGK",
      "policy": "Tanpa biaya tersembunyi",
      "image": "https://cdn.imagin.studio/getImage?customer=img&make=toyota&model=yaris&angle=23&zoomType=fullscreen"
    },
    {
      "name": "Honda Jazz",
      "category": "Ekonomi",
      "price": "Rp 395.000",
      "location": "Pusat Kota • Jakarta",
      "policy": "Gratis pembatalan",
      "image": "https://cdn.imagin.studio/getImage?customer=img&make=honda&model=jazz&angle=23&zoomType=fullscreen"
    },
    {
      "name": "Suzuki Swift",
      "category": "Mini",
      "price": "Rp 350.000",
      "location": "In terminal • DPS",
      "policy": "Tanpa biaya tambahan",
      "image": "https://cdn.imagin.studio/getImage?customer=img&make=suzuki&model=swift&angle=23&zoomType=fullscreen"
    },
    {
      "name": "Nissan Almera",
      "category": "Sedan",
      "price": "Rp 420.000",
      "location": "Shuttle • SUB",
      "policy": "Kebijakan BBM adil",
      "image": "https://cdn.imagin.studio/getImage?customer=img&make=nissan&model=almera&angle=23&zoomType=fullscreen"
    },
    {
      "name": "Hyundai i20",
      "category": "Ekonomi",
      "price": "Rp 430.000",
      "location": "In terminal • YIA",
      "policy": "Tanpa biaya tersembunyi",
      "image": "https://cdn.imagin.studio/getImage?customer=img&make=hyundai&model=i20&angle=23&zoomType=fullscreen"
    },
    {
      "name": "Kia Picanto",
      "category": "Mini",
      "price": "Rp 340.000",
      "location": "Pusat Kota • Bandung",
      "policy": "Gratis pembatalan",
      "image": "https://cdn.imagin.studio/getImage?customer=img&make=kia&model=picanto&angle=23&zoomType=fullscreen"
    },
    {
      "name": "Mitsubishi Mirage",
      "category": "Mini",
      "price": "Rp 355.000",
      "location": "Bandara • BPN",
      "policy": "Kebijakan BBM adil",
      "image": "https://cdn.imagin.studio/getImage?customer=img&make=mitsubishi&model=mirage&angle=23&zoomType=fullscreen"
    },
    {
      "name": "Mazda 2",
      "category": "Kompat",
      "price": "Rp 440.000",
      "location": "Shuttle • DPS",
      "policy": "Tanpa biaya tambahan",
      "image": "https://cdn.imagin.studio/getImage?customer=img&make=mazda&model=2&angle=23&zoomType=fullscreen"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pilih Mobil")),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}
