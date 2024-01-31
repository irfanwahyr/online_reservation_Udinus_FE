import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/models/reservasiModel/_cardReservasi.dart';
import 'package:kp2024/pages/dashboard/footer.dart';

class Keperluan extends StatefulWidget {
  const Keperluan({super.key});

  @override
  State<Keperluan> createState() => _KeperluanState();
}

class _KeperluanState extends State<Keperluan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Center(
              child: Heading2(
                text: "Silahkan Pilih Keperluan",
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Menggunakan Laboratorium",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Archivo", fontSize: 40),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Ubah menjadi Column jika lebar layar kurang dari atau sama dengan 600
                  if (constraints.maxWidth <= 900) {
                    return Column(
                      children: [
                        buildCardReservasi(
                            "Kuliah Pengganti", "images/gambar.jpg"),
                        SizedBox(height: 20),
                        buildCardReservasi(
                            "Acara Organisasi", "images/gambar.jpg"),
                        SizedBox(height: 20),
                        buildCardReservasi("Acara Kampus", "images/gambar.jpg"),
                      ],
                    );
                  } else {
                    // Tetap menggunakan Row jika lebar layar lebih besar dari 600
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCardReservasi(
                            "Kuliah Pengganti", "images/gambar.jpg"),
                        buildCardReservasi(
                            "Acara Organisasi", "images/gambar.jpg"),
                        buildCardReservasi("Acara Kampus", "images/gambar.jpg"),
                      ],
                    );
                  }
                },
              ),
            ),
            Footer().buildContainer()
          ],
        ),
      ),
    );
  }

  Widget buildCardReservasi(String nama, String imageAsset) {
    return CardReservasi(
      nama: nama,
      imageAsset: imageAsset,
      onTap: () {},
    ).buildInkwell();
  }
}
