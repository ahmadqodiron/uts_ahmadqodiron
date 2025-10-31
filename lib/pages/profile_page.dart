import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                  ),
                  child: Text("Daftar Sekarang"),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text("Wilayah"),
                  trailing: Text("Indonesia"),
                ),
                ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text("Mata Uang"),
                  trailing: Text("IDR"),
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text("Hubungi Kami"),
                ),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text("Tentang Kami"),
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Nilai Aplikasi Kami"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
