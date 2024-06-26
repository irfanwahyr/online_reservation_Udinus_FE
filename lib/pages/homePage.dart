import 'package:flutter/material.dart';
import 'package:kp2024/models/_btn_Logout.dart';
import 'package:kp2024/models/_buttonSecondary.dart';
import 'package:kp2024/models/_cardLab.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_heading7.dart';
import 'package:kp2024/models/_headingJudul.dart';
import 'package:kp2024/pages/admin/homePageAdmin.dart';
import 'package:kp2024/pages/detailLab/DetailLaboratorium.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';
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

    if (isLoggedIn) {
      if (prefs.getBool('role')! == true) {
        prefs.setInt('page_admin', 0);
        Navigator.pushReplacementNamed(context, HomePageAdmin.nameRoute);
      }
    } else {
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
                                Navigator.pushReplacementNamed(
                                    context, LogSign.nameRoute);
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
              // Lapisan1().buildContainer(context),
              // Lapisan2().buildContainer(),
              // Lapisan3().buildContainer(),
              // Lapisan4().buildContainer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 8, 68, 105),
                  ),
                  height: 1000,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Heading1(
                            text: "RESERVASI LABORATORIUM KOMPUTER",
                            color: Color.fromARGB(255, 255, 255, 255)),
                        const SizedBox(height: 10),
                        Heading2(
                            text: "UNIVERSITAS DIAN NUSWANTORO",
                            color: Color.fromARGB(255, 255, 255, 255)),
                        const SizedBox(height: 20),
                        HeadingJudul(
                            text: "Laboratorium Multimedia",
                            color: Colors.white),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB A",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "A");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "A");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB B",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "B");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "B");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB C",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "C");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "C");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB D",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "D");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "D");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB I",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "I");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "I");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB G",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "G");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "G");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB H",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "H");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "H");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB I",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "I");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "I");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB J",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "J");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "J");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB K",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "K");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "K");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB L",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "L");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "L");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB M",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "M");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "M");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardLab(
                                  imageAsset: "images/gambar.jpg",
                                  nama: "LAB N",
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "N");
                                    Navigator.pushNamed(
                                        context, Reservasi.nameRoute);
                                  },
                                ),
                                const SizedBox(height: 5),
                                ButtonSecondary(
                                  text: "detail",
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('nama_lab', "N");
                                    Navigator.pushNamed(
                                        context, DetailLaboratorium.nameRoute);
                                  },
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Footer().buildContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
