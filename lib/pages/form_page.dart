import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();

  DateTime? pickupDate;
  DateTime? dropoffDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Sewa Mobil")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: "Nama Lengkap"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: lokasiController,
              decoration: InputDecoration(labelText: "Lokasi / Alamat"),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text(pickupDate == null
                  ? "Pilih waktu pengambilan"
                  : pickupDate.toString()),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                pickupDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                setState(() {});
              },
            ),
            ListTile(
              title: Text(dropoffDate == null
                  ? "Pilih waktu drop off"
                  : dropoffDate.toString()),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                dropoffDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cars');
              },
              child: Text("Cari Mobil"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
