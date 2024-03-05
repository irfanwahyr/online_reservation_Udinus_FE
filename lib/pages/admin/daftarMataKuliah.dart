import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_appBarDaftarMataKuliah.dart';
import 'package:kp2024/pages/admin/kontenDaftarMataKuliah/kontenDaftarMataKuliah.dart';
import 'package:kp2024/pages/admin/sidebarAdmin.dart';

class DaftarMataKuliah extends StatefulWidget {
  static const nameRoute = "/DaftarMataKuliah";
  const DaftarMataKuliah({super.key});

  @override
  State<DaftarMataKuliah> createState() => _DaftarMataKuliahState();
}

class _DaftarMataKuliahState extends State<DaftarMataKuliah>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 13, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 13,
      child: Scaffold(
        drawer:
            const SideBarAdmin(), // Pastikan file sudah diimpor dengan benar
        appBar: AppBarDaftarMataKuliah(
          namaAdmin: "Nama Admin",
          imageAsset: 'images/gambar.jpg',
          tabController: _tabController,
        ),
        body: TabBarView(controller: _tabController, children: [
          KontenDaftarMataKuliah(nama_lab: "A"),
          KontenDaftarMataKuliah(nama_lab: "B"),
          KontenDaftarMataKuliah(nama_lab: "C"),
          KontenDaftarMataKuliah(nama_lab: "D"),
          KontenDaftarMataKuliah(nama_lab: "E"),
          KontenDaftarMataKuliah(nama_lab: "G"),
          KontenDaftarMataKuliah(nama_lab: "H"),
          KontenDaftarMataKuliah(nama_lab: "I"),
          KontenDaftarMataKuliah(nama_lab: "J"),
          KontenDaftarMataKuliah(nama_lab: "K"),
          KontenDaftarMataKuliah(nama_lab: "L"),
          KontenDaftarMataKuliah(nama_lab: "M"),
          KontenDaftarMataKuliah(nama_lab: "N"),
        ]),
      ),
    );
  }
}
