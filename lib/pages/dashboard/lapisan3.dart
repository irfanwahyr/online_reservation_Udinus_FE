import 'package:flutter/material.dart';
import 'package:kp2024/models/_customCard.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/pages/laboratorium/labDekstop.dart';
import 'package:kp2024/pages/laboratorium/labMultimedia.dart';
import 'package:kp2024/pages/laboratorium/labProgramming.dart';
import 'package:kp2024/pages/laboratorium/labStatistik.dart';

class Lapisan3 {
  Container buildContainer() {
    return Container(
      height: 500,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Color.fromARGB(142, 158, 158, 158),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Judul
          const Heading1(text: "RESERVASI RUANGAN", color: Colors.black),
          const Heading2(
            text: "Sesuai Spesifikasi dan Kebutuhan",
            color: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          // Cards
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) => CustomCard(
                    image: Image.asset("images/comp.jpg"),
                    title: "Multimedia",
                    onTap: () {
                      // Pindah ke halaman lain atau lakukan navigasi di sini
                      Navigator.pushReplacementNamed(context, LabMultimedia.nameRoute);
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Builder(
                  builder: (context) => CustomCard(
                    image: Image.asset("images/comp.jpg"),
                    title: "Dekstop",
                    onTap: () {
                      // Pindah ke halaman lain atau lakukan navigasi di sini
                      Navigator.pushReplacementNamed(context, LabDekstop.nameRoute);
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Builder(
                  builder: (context) => CustomCard(
                    image: Image.asset("images/comp.jpg"),
                    title: "Pemrograman",
                    onTap: () {
                      // Pindah ke halaman lain atau lakukan navigasi di sini
                      Navigator.pushReplacementNamed(context, LabProgramming.nameRoute);
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Builder(
                  builder: (context) => CustomCard(
                    image: Image.asset("images/comp.jpg"),
                    title: "Statistik",
                    onTap: () {
                      // Pindah ke halaman lain atau lakukan navigasi di sini
                      Navigator.pushReplacementNamed(context, LabStatistik.nameRoute);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
