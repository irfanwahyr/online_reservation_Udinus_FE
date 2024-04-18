import 'package:flutter/material.dart';
import 'package:kp2024/models/_btn_Logout.dart';
import 'package:kp2024/pages/admin/homePageAdmin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kp2024/models/_buttonPrimary.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/dashboard/lapisan1.dart';
import 'package:kp2024/pages/dashboard/lapisan2.dart';
import 'package:kp2024/pages/dashboard/lapisan3.dart';
import 'package:kp2024/pages/dashboard/lapisan4.dart';
import 'package:kp2024/pages/logSign.dart';

double collapsableHeight = 0.0;
Color selected = const Color(0xffffffff);
Color notSelected = const Color(0xafffffff);

class HomePage extends StatefulWidget {
  static const nameRoute = 'homePage';
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String? _token = '';
  late String? _username = '';

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    _getToken();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if(isLoggedIn){
      if(prefs.getBool('role')! == true){
        prefs.setInt('page_admin', 0);
        Navigator.pushReplacementNamed(context, HomePageAdmin.nameRoute);
      } else {
        // Navigator.pushReplacementNamed(context, HomePage.nameRoute);
      }
    } else {
      // Navigator.pushReplacementNamed(context, HomePage.nameRoute);
      prefs.clear();
    }
    setState(() {
      isLoggedIn = isLoggedIn;
    });
  }

  Future<void> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
      _username = prefs.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
            // width: double.maxFinite,
            height: 200,
            color: const Color.fromARGB(255, 1, 24, 50),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Heading2(
                    text: "Selamat Datang",
                    color: Colors.white,
                  ),
                  MediaQuery.of(context).size.width < 400
                      ? _token != null
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                  "$_username", // Ganti 'Nama' dengan teks yang ingin ditampilkan saat pengguna terautentikasi
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                              ),
                            ],
                          )
                          : PopupMenuButton<String>(
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem<String>(
                                    child: Container(
                                      color: Colors.white,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                              context, LogSign.nameRoute);
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Daftar / Login',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 1, 24, 50),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ];
                              },
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            )
                      : _token != null
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                  '$_username', // Ganti 'Nama' dengan teks yang ingin ditampilkan saat pengguna terautentikasi
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 5),
                                ButtonLogOut()
                            ],
                          )
                          : HoverButtonPrimary(
                              text: "Daftar/Login",
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, LogSign.nameRoute);
                              },
                            ),
                ],
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 1, 24, 50)),
      body: SingleChildScrollView(
        child: Padding(
          // padding: const EdgeInsets.only(left: 16, right: 16),
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lapisan1().buildContainer(context),
              Lapisan2().buildContainer(),
              Lapisan3().buildContainer(),
              Lapisan4().buildContainer(),
              Footer().buildContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
