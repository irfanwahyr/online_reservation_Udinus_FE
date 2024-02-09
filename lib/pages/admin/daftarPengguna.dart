import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_appBarDaftarPengguna.dart';
import 'package:kp2024/pages/admin/kontenDaftarPengguna/kontenDaftarPengguna.dart';
import 'package:kp2024/pages/admin/sidebarAdmin.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        drawer:
            const SideBarAdmin(), // Pastikan file sudah diimpor dengan benar
        appBar: AppBarDaftarPengguna(
          namaAdmin: "Nama Admin",
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
