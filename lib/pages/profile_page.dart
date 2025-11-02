import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? selectedRegion = "Indonesia";
  String currency = "IDR";
  double balance = 250000; // saldo simulasi
  double rating = 0;

  // simulasi status login
  bool isRegistered = false;
  String userName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (!isRegistered) {
                    _showRegisterDialog(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Anda sudah terdaftar sebagai $userName")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  isRegistered ? "Terdaftar: $userName" : "Daftar Sekarang",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 25),

            // 🔹 Wilayah
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Wilayah"),
              trailing: DropdownButton<String>(
                value: selectedRegion,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(value: "Indonesia", child: Text("Indonesia")),
                  DropdownMenuItem(value: "Malaysia", child: Text("Malaysia")),
                  DropdownMenuItem(value: "Singapura", child: Text("Singapura")),
                  DropdownMenuItem(value: "Thailand", child: Text("Thailand")),
                ],
                onChanged: (value) {
                  setState(() => selectedRegion = value);
                },
              ),
            ),

            // 🔹 Mata Uang / Saldo
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text("Mata Uang / Saldo"),
              subtitle: Text("$currency  ${balance.toStringAsFixed(0)}"),
              trailing: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    balance += 50000;
                  });
                },
              ),
            ),

            // 🔹 Hubungi Kami (pakai icon chat hijau)
            ListTile(
              leading: const Icon(Icons.chat, color: Colors.green),
              title: const Text("Hubungi Kami"),
              onTap: () {
                _launchWhatsApp("+6282331474660", "Halo Admin, saya butuh bantuan.");
              },
            ),

            // 🔹 Tentang Kami
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("Tentang Kami"),
              onTap: () {
                _showAboutApp(context);
              },
            ),

            // 🔹 Nilai Aplikasi
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Nilai Aplikasi Kami"),
              onTap: () {
                _showRatingDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // 🧾 Dialog Form Pendaftaran
  void _showRegisterDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Daftar Akun"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nama Lengkap"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
            ],
          ),
          actions: [
            TextButton(child: const Text("Batal"), onPressed: () => Navigator.pop(context)),
            ElevatedButton(
              child: const Text("Daftar"),
              onPressed: () {
                setState(() {
                  isRegistered = true;
                  userName = nameController.text;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Pendaftaran berhasil!")));
              },
            ),
          ],
        );
      },
    );
  }

  // 💬 WhatsApp launcher
  Future<void> _launchWhatsApp(String phone, String message) async {
    final Uri url = Uri.parse("https://wa.me/$phone?text=${Uri.encodeComponent(message)}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Tidak bisa membuka WhatsApp")));
    }
  }

  // ℹ️ Tentang Kami
  void _showAboutApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Tentang Kami"),
          content: const Text(
            "Aplikasi Rental Mobil ini memudahkan Anda mencari, membandingkan, dan memesan mobil dari berbagai penyedia terpercaya. "
            "Nikmati pengalaman sewa mobil yang cepat, aman, dan transparan.",
          ),
          actions: [
            TextButton(child: const Text("Tutup"), onPressed: () => Navigator.pop(context)),
          ],
        );
      },
    );
  }

  // ⭐ Pop-up Rating
  void _showRatingDialog(BuildContext context) {
    double tempRating = rating;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Nilai Aplikasi Kami"),
          content: StatefulBuilder(
            builder: (context, setStateDialog) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < tempRating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 35,
                    ),
                    onPressed: () {
                      setStateDialog(() {
                        tempRating = index + 1.0;
                      });
                    },
                  );
                }),
              );
            },
          ),
          actions: [
            TextButton(child: const Text("Batal"), onPressed: () => Navigator.pop(context)),
            ElevatedButton(
              child: const Text("Kirim"),
              onPressed: () {
                setState(() {
                  rating = tempRating;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Terima kasih atas penilaian Anda ⭐ $rating")));
              },
            ),
          ],
        );
      },
    );
  }
}
