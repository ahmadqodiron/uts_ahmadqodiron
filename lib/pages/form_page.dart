import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

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
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text(
          "Data Sewa Mobil",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF4B2B),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔹 Header
              const SizedBox(height: 10),
              const Text(
                "Lengkapi Data Sewa Anda",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Isi informasi di bawah ini untuk melanjutkan pemesanan mobil",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              const SizedBox(height: 30),

              // 🔹 Card form
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Nama
                    TextField(
                      controller: namaController,
                      decoration: InputDecoration(
                        labelText: "Nama Lengkap",
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.redAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Lokasi
                    TextField(
                      controller: lokasiController,
                      decoration: InputDecoration(
                        labelText: "Lokasi / Alamat",
                        prefixIcon:
                            const Icon(Icons.location_on, color: Colors.redAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Waktu Pengambilan
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.black12),
                      ),
                      leading: const Icon(Icons.access_time,
                          color: Colors.redAccent),
                      title: Text(
                        pickupDate == null
                            ? "Pilih waktu pengambilan"
                            : "${pickupDate!.day}/${pickupDate!.month}/${pickupDate!.year}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: const Icon(Icons.calendar_today,
                          color: Colors.redAccent),
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
                    const SizedBox(height: 10),

                    // Waktu Drop Off
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.black12),
                      ),
                      leading: const Icon(Icons.directions_car_filled,
                          color: Colors.redAccent),
                      title: Text(
                        dropoffDate == null
                            ? "Pilih waktu drop off"
                            : "${dropoffDate!.day}/${dropoffDate!.month}/${dropoffDate!.year}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: const Icon(Icons.calendar_today,
                          color: Colors.redAccent),
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
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 🔹 Tombol Cari Mobil
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cars');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4B2B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 4,
                    shadowColor: Colors.redAccent.withOpacity(0.4),
                  ),
                  child: const Text(
                    "Cari Mobil",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
