import 'package:flutter/material.dart';
import 'package:kp2024/models/_appBarLogin.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/models/appBarUniversal.dart';
import 'package:kp2024/models/reservasiModel/_cardReservasi.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/logSign.dart';
import 'package:kp2024/pages/user/formKeperluan/acaraKampus.dart';
import 'package:kp2024/pages/user/formKeperluan/acaraOrganisasi.dart';
import 'package:kp2024/pages/user/formKeperluan/kuliahPengganti.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Keperluan extends StatefulWidget {
  static const nameRoute = 'Keperluan';
  const Keperluan({super.key});

  @override
  State<Keperluan> createState() => _KeperluanState();
}

class _KeperluanState extends State<Keperluan> {
  late String? _username = '';
  late String? token = '';
  @override
  void initState() {
    super.initState();
    _getToken();
  }

    Future<void> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username');
      token = prefs.getString('token');
    });
  }

  void _logout() async {
    // Tampilkan dialog konfirmasi
    bool? logoutConfirmed = await _showLogoutConfirmationDialog(context);
    if (logoutConfirmed ?? false) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      Navigator.pushReplacementNamed(context, LogSign.nameRoute);
    }
  }

    Future<bool?> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah Anda yakin ingin logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Tidak
              },
              child: Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Ya
              },
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar :  AppBarUniversal(
        token: token ?? "", // Pass the token
        username: _username ?? "", // Pass the username
        logoutCallback: () {
          _logout(); // Logout callback
        },
        pushnamed: () {
          Navigator.pushReplacementNamed(context, Reservasi.nameRoute);
        }

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Heading2(
                text: "Silahkan Pilih Keperluan",
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Menggunakan Laboratorium",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Archivo", fontSize: 40),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, left: 10, right: 10, bottom: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth <= 900) {
                    return Column(
                      children: buildContent(),
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: buildContent(),
                    );
                  }
                },
              ),
            ),
            Footer().buildContainer()
          ],
        ),
      ),
    );
  }

  List<Widget> buildContent() {
    return [
      CardReservasi(
        nama: "Kuliah Pengganti",
        imageAsset: "images/gambar.jpg",
        onTap: () {
          Navigator.pushReplacementNamed(context, KuliahPengganti.nameRoute);
        },
      ),
      SizedBox(height: 10),
      CardReservasi(
        nama: "Acara Organisasi",
        imageAsset: "images/gambar.jpg",
        onTap: () {
          Navigator.pushReplacementNamed(context, AcaraOrganisasi.nameRoute);
        },
      ),
      SizedBox(height: 10),
      CardReservasi(
        nama: "Acara Kampus",
        imageAsset: "images/gambar.jpg",
        onTap: () {
          Navigator.pushReplacementNamed(context, AcaraKampus.nameRoute);
        },
      )
    ];
  }
}
