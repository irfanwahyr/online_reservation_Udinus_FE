import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_appBarAdmin.dart';
import 'package:kp2024/pages/admin/KontenHomePage/acaraKampusAdmin.dart';
import 'package:kp2024/pages/admin/KontenHomePage/acaraOrganisasiAdmin.dart';
import 'package:kp2024/pages/admin/KontenHomePage/kuliahPenggantiAdmin.dart';
import 'package:kp2024/pages/admin/sidebarAdmin.dart';

class HomePageAdmin extends StatefulWidget {
  static const nameRoute = "HomePageAdmin";
  const HomePageAdmin({Key? key}) : super(key: key);

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer:
            const SideBarAdmin(), // Pastikan file sudah diimpor dengan benar
        appBar: AppBarAdmin(
          namaAdmin: "Nama Admin",
          imageAsset: 'images/gambar.jpg',
          tabController: _tabController,
          
        ),
        body: TabBarView(controller: _tabController, children: [
          KuliahPenggantiAdmin(),
          AcaraOrganisasiAdmin(),
          AcaraKampusAdmin(),
        ]),
      ),
    );
  }
}
