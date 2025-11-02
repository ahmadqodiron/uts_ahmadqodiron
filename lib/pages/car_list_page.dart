import 'package:flutter/material.dart';
import 'payment_page.dart';
import 'profile_page.dart';

// ✅ Pindahkan daftar mobil ke luar class agar tidak error
final List<Map<String, dynamic>> cars = [
  {
    "name": "Toyota Avanza",
    "category": "MPV",
    "price": "Rp 400.000",
    "location": "Bandara • CGK",
    "policy": "Tanpa biaya tersembunyi",
    "image": "assets/images/avanza.png"
  },
  {
    "name": "Honda Brio",
    "category": "Hatchback",
    "price": "Rp 350.000",
    "location": "Pusat Kota • Jakarta",
    "policy": "Gratis pembatalan",
    "image": "assets/images/brio.png"
  },
  {
    "name": "Daihatsu Xenia",
    "category": "MPV",
    "price": "Rp 390.000",
    "location": "Shuttle • SUB",
    "policy": "Kebijakan BBM adil",
    "image": "assets/images/xenia.png"
  },
  {
    "name": "Honda Jazz",
    "category": "Hatchback",
    "price": "Rp 395.000",
    "location": "Pusat Kota • Bandung",
    "policy": "Tanpa biaya tambahan",
    "image": "assets/images/jazz.png"
  },
  {
    "name": "Toyota Yaris",
    "category": "Hatchback",
    "price": "Rp 410.000",
    "location": "Bandara • DPS",
    "policy": "Gratis pembatalan",
    "image": "assets/images/yaris.png"
  },
  {
    "name": "Suzuki Ertiga",
    "category": "MPV",
    "price": "Rp 420.000",
    "location": "In terminal • YIA",
    "policy": "Tanpa biaya tambahan",
    "image": "assets/images/ertiga.png"
  },
  {
    "name": "Toyota Agya",
    "category": "City Car",
    "price": "Rp 330.000",
    "location": "Bandara • BPN",
    "policy": "Kebijakan BBM adil",
    "image": "assets/images/agya.png"
  },
  {
    "name": "Daihatsu Ayla",
    "category": "City Car",
    "price": "Rp 320.000",
    "location": "Pusat Kota • Surabaya",
    "policy": "Gratis pembatalan",
    "image": "assets/images/ayla.png"
  },
  {
    "name": "Honda Mobilio",
    "category": "MPV",
    "price": "Rp 430.000",
    "location": "Shuttle • DPS",
    "policy": "Tanpa biaya tambahan",
    "image": "assets/images/mobilio.png"
  },
  {
    "name": "Toyota Calya",
    "category": "MPV",
    "price": "Rp 370.000",
    "location": "Pusat Kota • Medan",
    "policy": "Gratis pembatalan",
    "image": "assets/images/calya.png"
  },
];

class CarListPage extends StatefulWidget {
  const CarListPage({super.key});

  @override
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CarListView(),
    const ProfilePage(),
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
        selectedItemColor: const Color(0xFFFF4B2B),
        unselectedItemColor: Colors.grey.shade500,
        backgroundColor: Colors.white,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car_filled_outlined),
            activeIcon: Icon(Icons.directions_car, color: Color(0xFFFF4B2B)),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person, color: Color(0xFFFF4B2B)),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class CarListView extends StatelessWidget {
  const CarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text(
          "Pilih Mobil",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFFF4B2B),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    car["image"],
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        car["name"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF222222),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.category,
                              color: Colors.redAccent, size: 18),
                          const SizedBox(width: 5),
                          Text(
                            car["category"],
                            style: const TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(width: 15),
                          const Icon(Icons.pin_drop,
                              color: Colors.redAccent, size: 18),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              car["location"],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.local_gas_station,
                              color: Colors.redAccent, size: 18),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              car["policy"],
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${car["price"]} / hari",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF4B2B),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF4B2B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/payment',
                                arguments: car,
                              );
                            },
                            child: const Text(
                              "Sewa",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
