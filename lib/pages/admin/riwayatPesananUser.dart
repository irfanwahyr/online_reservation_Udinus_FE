import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_appBarRiwayatPesananUser.dart';
import 'package:kp2024/pages/admin/kontenRiwayat/kontenRiwayatPesananUser.dart';
import 'package:kp2024/pages/admin/sidebarAdmin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiwayatPesananUser extends StatefulWidget {
  static const nameRoute = "/RiwayatPesananUser";
  const RiwayatPesananUser({super.key});

  @override
  State<RiwayatPesananUser> createState() => _RiwayatPesananUserState();
}

class _RiwayatPesananUserState extends State<RiwayatPesananUser>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
    SharedPreferences.getInstance().then((SharedPreferences srf) {
      setState(() {
        username = srf.getString('username');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        drawer: SideBarAdmin(
          email: email.toString(),
          username: username.toString(),
        ),
        appBar: AppBarRiwayatUser(
          namaAdmin: username.toString(),
          imageAsset: 'images/gambar.jpg',
          tabController: _tabController,
        ),
        body: TabBarView(controller: _tabController, children: [
          KontenRiwayatPesananUser(),
        ]),
      ),
    );
  }
}
