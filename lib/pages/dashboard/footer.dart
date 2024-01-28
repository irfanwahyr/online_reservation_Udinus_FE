import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/models/_heading3.dart';
import 'package:kp2024/models/_iconText.dart';

class Footer {
  Container buildContainer() {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/LogoLab.png"),
            Padding(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 700) {
                    // Jika lebar layar lebih besar dari 600, tampilkan sebagai row
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: buildColumns(),
                    );
                  } else {
                    // Jika lebar layar kurang dari atau sama dengan 600, tampilkan sebagai column
                    return Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: buildColumns(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildColumns() {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Heading2(text: "Kunjungi Kami", color: Colors.white),
          SizedBox(height: 40),
          IconText(
            imageAsset: "images/iconLokasi.png",
            text: "Jl. Nakula Raya No 68, Pendrikan Kidul, Semarang",
          ),
          SizedBox(
            height: 20,
          ),
          IconText(
            imageAsset: "images/iconTelepon.png",
            text: "+6234536785476",
          ),
          SizedBox(
            height: 20,
          ),
          IconText(
            imageAsset: "images/iconEmail.png",
            text: "dinuslabudinus@dinus.ac.id",
          ),
        ],
      ),
      SizedBox(
        width: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Heading2(text: "Tentang Kami", color: Colors.white),
          SizedBox(
            height: 40,
          ),
          Heading3(
            text:
                "Laboratorium komputer Universitas Dian Nuswantoro (UDINUS) yang telah \ntersertifikasi ISO 9001:2015 memiliki 14 laboratorium dengan \nspesifikasi masing-masing. Laboratorium ini telah berpengalaman \ndalam menyelenggarakan berbagai kegiatan praktikum, \nseminar, dan workshop di bidang komputer. Selain itu, laboratorium ini juga \ndilengkapi dengan genset untuk mengantisipasi terjadinya \npemadaman listrik.",
            color: Colors.white,
          ),
        ],
      ),
      SizedBox(
        width: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Heading2(text: "Sosial Media", color: Colors.white),
          SizedBox(height: 40),
          IconText(
            imageAsset: "images/iconInstagram.png",
            text: "@labdinusisoyaul",
          ),
          SizedBox(
            height: 20,
          ),
          IconText(
            imageAsset: "images/iconWhatsapp.png",
            text: "+6287765439876",
          ),
          SizedBox(
            height: 20,
          ),
          IconText(
            imageAsset: "images/iconFacebook.png",
            text: "labkomputerudinus",
          ),
        ],
      ),
    ];
  }
}
