import 'package:flutter/material.dart';
import 'package:kp2024/models/_customCard.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/pages/user/coba.dart';

class Lapisan3 {
  Container buildContainer() {
    return Container(
      height: 500,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color.fromARGB(142, 158, 158, 158),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Judul
          Heading1(text: "RESERVASI RUANGAN", color: Colors.black),
          Heading2(
            text: "Sesuai Spesifikasi dan Kebutuhan",
            color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          // Cards
          SingleChildScrollView(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Coba(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Builder(
                  builder: (context) => CustomCard(
                    image: Image.asset("images/comp.jpg"),
                    title: "Dekstop",
                    onTap: () {
                      // Pindah ke halaman lain atau lakukan navigasi di sini
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Coba(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Builder(
                  builder: (context) => CustomCard(
                    image: Image.asset("images/comp.jpg"),
                    title: "Pemrograman",
                    onTap: () {
                      // Pindah ke halaman lain atau lakukan navigasi di sini
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Coba(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Builder(
                  builder: (context) => CustomCard(
                    image: Image.asset("images/comp.jpg"),
                    title: "Statistik",
                    onTap: () {
                      // Pindah ke halaman lain atau lakukan navigasi di sini
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Coba(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
