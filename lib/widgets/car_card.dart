import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Map<String, dynamic> car;

  const CarCard({required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 3,
      child: ListTile(
        leading: Image.network(car["image"], width: 100, fit: BoxFit.cover),
        title: Text(car["name"], style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Harga: ${car["price"]}"),
        trailing: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Pesan ${car["name"]} berhasil!")),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text("Pesan Sekarang"),
        ),
      ),
    );
  }
}
