import 'package:flutter/material.dart';
import 'package:kp2024/models/_appBarLogin.dart';
import 'package:kp2024/models/_buttonPrimary.dart';
import 'package:kp2024/models/_buttonSecondary.dart';
import 'package:kp2024/models/_cardLab.dart';
import 'package:kp2024/models/_containerLab.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/detailLab/detailJ.dart';
import 'package:kp2024/pages/detailLab/detailK.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LabDekstop extends StatefulWidget {
  static const nameRoute = 'LabDekstop';
  const LabDekstop({Key? key}) : super(key: key);

  @override
  State<LabDekstop> createState() => _LabDekstopState();
}

class _LabDekstopState extends State<LabDekstop> {
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
              nama: "Laboratorium Dekstop",
              imageAsset: "images/gambar.jpg",
              deskripsi:
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
                          nama: "LAB J",
                          onTap: () {}),
                      const SizedBox(height: 5),
                      ButtonSecondary(
                          text: "detail",
                          onPressed: () {
                            Navigator.pushNamed(context, DetailJ.nameRoute);
                          }),
                      const SizedBox(height: 5),
                      HoverButtonPrimary(
                        text: "Reservasi",
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setString('data', "J");
                          Navigator.pushNamed(context, Reservasi.nameRoute);
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardLab(
                          imageAsset: "images/gambar.jpg",
                          nama: "LAB K",
                          onTap: () {}),
                      const SizedBox(height: 5),
                      ButtonSecondary(
                          text: "detail",
                          onPressed: () {
                            Navigator.pushNamed(context, DetailK.nameRoute);
                          }),
                      const SizedBox(height: 5),
                      HoverButtonPrimary(
                        text: "Reservasi",
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setString('data', "K");
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
