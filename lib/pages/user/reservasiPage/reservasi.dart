import 'package:flutter/material.dart';
import 'package:kp2024/models/appBarUniversal.dart';
import 'package:kp2024/pages/logSign.dart';
import 'package:kp2024/pages/user/reservasiPage/pesanan.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasiContent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reservasi extends StatefulWidget {
  static const nameRoute = "/Reservasi";

  const Reservasi({Key? key}) : super(key: key);

  @override
  State<Reservasi> createState() => _ReservasiState();
}

class _ReservasiState extends State<Reservasi>
    with SingleTickerProviderStateMixin {
  late String? _username = '';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _getToken();
    _tabController =
        TabController(length: 2, vsync: this); // Initialize TabController
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose TabController when not needed
    super.dispose();
  }

  Future<void> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username');
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
      appBar: AppBarUniversal(
        username: _username ?? "", // Pass the username
        logoutCallback: () {
          _logout(); // Logout callback
        },
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController, // Connect TabBar to TabController
            tabs: [
              Tab(text: 'Reservasi'),
              Tab(text: 'Pesanan'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController, // Connect TabBarView to TabController
              children: [
                ReservasiContent(),
                Pesanan(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
