import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_appBarAdmin.dart';
import 'package:kp2024/pages/admin/KontenHomePage/acaraKampusAdmin.dart';
import 'package:kp2024/pages/admin/KontenHomePage/acaraOrganisasiAdmin.dart';
import 'package:kp2024/pages/admin/KontenHomePage/kuliahPenggantiAdmin.dart';
import 'package:kp2024/pages/admin/sidebarAdmin.dart';
import 'package:kp2024/pages/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageAdmin extends StatefulWidget {
  static const nameRoute = "/HomePageAdmin";
  const HomePageAdmin({Key? key}) : super(key: key);

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

String? email, username;

class _HomePageAdminState extends State<HomePageAdmin>with SingleTickerProviderStateMixin {
  late TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    SharedPreferences.getInstance().then((SharedPreferences srf) {
      setState(() {
        email = srf.getString('email');
        username = srf.getString('username');
        _tabController!.index = srf.getInt('page_admin') ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: SideBarAdmin(
          username: username.toString(),
          email: email.toString(),
        ),
        appBar: AppBarAdmin(
          namaAdmin: username.toString(),
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
