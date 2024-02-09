import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_appBarDaftarLaboratorium.dart';

import 'package:kp2024/pages/admin/kontenDaftarLaboratorium/kontenDaftarLaboratorium.dart';
import 'package:kp2024/pages/admin/sidebarAdmin.dart';

class DaftarLaboratorium extends StatefulWidget {
  static const nameRoute = "/DaftarLaboratorium";
  const DaftarLaboratorium({super.key});

  @override
  State<DaftarLaboratorium> createState() => _DaftarLaboratoriumState();
}

class _DaftarLaboratoriumState extends State<DaftarLaboratorium>
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
        appBar: AppbarDaftarLaboratorium(
          namaAdmin: "Nama Admin",
          imageAsset: 'images/gambar.jpg',
          tabController: _tabController,
        ),
        body: TabBarView(controller: _tabController, children: [
          KontenDaftarLaboratorium(),
        ]),
      ),
    );
  }
}
