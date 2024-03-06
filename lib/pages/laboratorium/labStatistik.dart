import 'package:flutter/material.dart';
import 'package:kp2024/models/_appBarLogin.dart';
import 'package:kp2024/models/_buttonPrimary.dart';
import 'package:kp2024/models/_buttonSecondary.dart';
import 'package:kp2024/models/_cardLab.dart';
import 'package:kp2024/models/_containerLab.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/detailLab/DetailLaboratorium.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LabStatistik extends StatefulWidget {
  static const nameRoute = 'LabStatistik';
  const LabStatistik({Key? key}) : super(key: key);

  @override
  State<LabStatistik> createState() => _LabStatistikState();
}

class _LabStatistikState extends State<LabStatistik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLogin(
          namaUser: "Abiyyu", imageAsset: "images/iconPerson.png"),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ContainerLab(
              jenis_lab: "Laboratorium Statistik",
              imageAsset: "images/gambar.jpg",
              deskripsi_lab:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardLab(
                          imageAsset: "images/gambar.jpg",
                          nama: "LAB G",
                          onTap: () {}),
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
                      const SizedBox(height: 5),
                      HoverButtonPrimary(
                        text: "Reservasi",
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setString('nama_lab', "G");
                          Navigator.pushNamed(context, Reservasi.nameRoute);
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardLab(
                          imageAsset: "images/gambar.jpg",
                          nama: "LAB H",
                          onTap: () {}),
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
                      const SizedBox(height: 5),
                      HoverButtonPrimary(
                        text: "Reservasi",
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setString('nama_lab', "H");
                          Navigator.pushNamed(context, Reservasi.nameRoute);
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardLab(
                          imageAsset: "images/gambar.jpg",
                          nama: "LAB L",
                          onTap: () {}),
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
                      const SizedBox(height: 5),
                      HoverButtonPrimary(
                        text: "Reservasi",
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setString('nama_lab', "L");
                          Navigator.pushNamed(context, Reservasi.nameRoute);
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Footer().buildContainer(),
          ],
        ),
      ),
    );
  }
}
