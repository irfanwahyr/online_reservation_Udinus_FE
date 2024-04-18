import 'package:flutter/material.dart';
import 'package:kp2024/controllers/login_signin/signinLogin.dart';
import 'package:kp2024/models/admin/_appBarAdmin.dart';
import 'package:kp2024/pages/admin/KontenHomePage/acaraKampusAdmin.dart';
import 'package:kp2024/pages/admin/KontenHomePage/acaraOrganisasiAdmin.dart';
import 'package:kp2024/pages/admin/KontenHomePage/kuliahPenggantiAdmin.dart';
import 'package:kp2024/pages/admin/sidebarAdmin.dart';
import 'package:kp2024/pages/homePage.dart';
import 'package:kp2024/pages/logSign.dart';
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
    initializeLoginStatus();
  }

  Future<void> initializeLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      _checkLoginStatus();
    }
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if(prefs.getInt('token') != null){
      await logout();
      SharedPreferences srf = await SharedPreferences.getInstance();
      srf.setBool('isLoggedIn', false);
      srf.setString('token', '');
      srf.setInt('id_user', 0);
      srf.setString('username', 'username');
      srf.setBool('role', false);
      srf.setInt('loginTime', 0);
      print('otomatis logout');

      Navigator.pushReplacementNamed(context, LogSign.nameRoute);
    } else {
      if(isLoggedIn){
        if(prefs.getBool('role')! == true){
          prefs.setInt('page_admin', 0);
          Navigator.pushReplacementNamed(context, HomePageAdmin.nameRoute);
        } else {
          Navigator.pushReplacementNamed(context, HomePage.nameRoute);
        }
      } else {
        Navigator.pushReplacementNamed(context, HomePage.nameRoute);
        prefs.clear();
      }
      setState(() {
        isLoggedIn = isLoggedIn;
      });
    }
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
