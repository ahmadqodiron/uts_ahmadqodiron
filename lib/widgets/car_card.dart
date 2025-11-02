import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Map<String, dynamic> car;

  const CarCard({required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        car["name"],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(car["category"], style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8),
                      Row(
                        children: const [
                          Icon(Icons.airline_seat_recline_normal, size: 16),
                          SizedBox(width: 4),
                          Text("4  "),
                          Icon(Icons.work_outline, size: 16),
                          SizedBox(width: 4),
                          Text("1  "),
                          Icon(Icons.people, size: 16),
                          SizedBox(width: 4),
                          Text("4"),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(car["location"]),
                      Text(car["policy"], style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      car["image"],
                      fit: BoxFit.cover,
                      height: 80,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.car_rental, size: 60, color: Colors.grey);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    car["price"],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/payment', arguments: car);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text(
                    "Pesan Sekarang",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
