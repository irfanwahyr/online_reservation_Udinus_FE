import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_appBarDaftarPengguna.dart';
import 'package:kp2024/pages/admin/kontenDaftarPengguna/kontenDaftarPengguna.dart';
import 'package:kp2024/pages/admin/sidebarAdmin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DaftarPengguna extends StatefulWidget {
  static const nameRoute = "/DaftarPengguna";
  const DaftarPengguna({super.key});

  @override
  State<DaftarPengguna> createState() => _DaftarPenggunaState();
}

class _DaftarPenggunaState extends State<DaftarPengguna>
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
        drawer: SideBarAdmin(email: email.toString(), username: username.toString(),),
        appBar: AppBarDaftarPengguna(
          namaAdmin: username.toString(),
          imageAsset: 'images/gambar.jpg',
          tabController: _tabController,
        ),
        body: TabBarView(controller: _tabController, children: [
          KontenDaftarPengguna(),
        ]),
      ),
    );
  }
}
