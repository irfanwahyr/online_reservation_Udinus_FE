import 'package:flutter/material.dart';
import 'package:kp2024/models/_appBarLogin.dart';
import 'package:kp2024/models/_buttonPrimary.dart';
import 'package:kp2024/models/_buttonSecondary.dart';
import 'package:kp2024/models/_cardLab.dart';
import 'package:kp2024/models/_containerLab.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/detailLab/detailA.dart';
import 'package:kp2024/pages/detailLab/detailB.dart';
import 'package:kp2024/pages/detailLab/detailD.dart';
import 'package:kp2024/pages/detailLab/detailI.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';

class LabMultimedia extends StatefulWidget {
  static const nameRoute = 'LabMultimedia';
  const LabMultimedia({Key? key}) : super(key: key);

  @override
  State<LabMultimedia> createState() => _LabMultimediaState();
}

class _LabMultimediaState extends State<LabMultimedia> {
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
              nama: "Laboratorium Multimedia",
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
                          nama: "LAB A",
                          onTap: () {}),
                      const SizedBox(height: 5),
                      ButtonSecondary(
                          text: "detail",
                          onPressed: () {
                            Navigator.pushNamed(context, DetailA.nameRoute);
                          }),
                      const SizedBox(height: 5),
                      HoverButtonPrimary(
                        text: "Reservasi",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Reservasi(
                                namaLab: "A",
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardLab(
                          imageAsset: "images/gambar.jpg",
                          nama: "LAB B",
                          onTap: () {}),
                      const SizedBox(height: 5),
                      ButtonSecondary(
                          text: "detail",
                          onPressed: () {
                            Navigator.pushNamed(context, DetailB.nameRoute);
                          }),
                      const SizedBox(height: 5),
                      HoverButtonPrimary(
                        text: "Reservasi",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Reservasi(
                                namaLab: "B",
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardLab(
                          imageAsset: "images/gambar.jpg",
                          nama: "LAB D",
                          onTap: () {}),
                      const SizedBox(height: 5),
                      ButtonSecondary(
                          text: "detail",
                          onPressed: () {
                            Navigator.pushNamed(context, DetailD.nameRoute);
                          }),
                      const SizedBox(height: 5),
                      HoverButtonPrimary(
                        text: "Reservasi",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Reservasi(
                                namaLab: "D",
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardLab(
                          imageAsset: "images/gambar.jpg",
                          nama: "LAB I",
                          onTap: () {}),
                      const SizedBox(height: 5),
                      ButtonSecondary(
                          text: "detail",
                          onPressed: () {
                            Navigator.pushNamed(context, DetailI.nameRoute);
                          }),
                      const SizedBox(height: 5),
                      HoverButtonPrimary(
                        text: "Reservasi",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Reservasi(
                                namaLab: "I",
                              ),
                            ),
                          );
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
