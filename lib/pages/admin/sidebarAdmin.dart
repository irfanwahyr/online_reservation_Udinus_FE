import 'package:flutter/material.dart';
import 'package:kp2024/pages/admin/daftarLaboratorium.dart';
import 'package:kp2024/pages/admin/daftarMataKuliah.dart';
import 'package:kp2024/pages/admin/daftarPengguna.dart';
import 'package:kp2024/pages/admin/homePageAdmin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideBarAdmin extends StatefulWidget {
  const SideBarAdmin({
    Key? key,
    required this.username,
    required this.email
  }) : super(key: key);

  final String username;
  final String email;

  @override
  State<SideBarAdmin> createState() => _SideBarAdminState();
}

String? username, email;


class _SideBarAdminState extends State<SideBarAdmin> {
  @override
  void initState(){
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences srf) {
      setState(() {
        email = srf.getString('email');
        username = srf.getString('username');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(username.toString()),
            accountEmail: Text(email.toString()),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/anis.png'),
              ),
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 1, 24, 50),
            ),
          ),
          ListTile(
            leading: Icon(Icons.public_outlined),
            title: Text("Peminjaman"),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePageAdmin.nameRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle_sharp),
            title: Text("Daftar Pengguna"),
            onTap: () {
              Navigator.pushReplacementNamed(context, DaftarPengguna.nameRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.book_rounded),
            title: Text("Daftar Matkul"),
            onTap: () {
              Navigator.pushReplacementNamed(context, DaftarMataKuliah.nameRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.computer),
            title: Text("Daftar Laboratorium"),
            onTap: () {
              Navigator.pushReplacementNamed(context, DaftarLaboratorium.nameRoute);
            },
          ),
        ],
      ),
    );
  }
}
