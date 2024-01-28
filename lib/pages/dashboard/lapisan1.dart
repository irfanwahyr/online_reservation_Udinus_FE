import 'package:flutter/material.dart';
import 'package:kp2024/models/_buttonPrimary.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/models/_heading3.dart';

class Lapisan1 {
  Container buildContainer() {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(190, 129, 129, 129)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Heading1(
                        text: "Laboratorium Komputer",
                        color: Color.fromARGB(255, 2, 45, 95),
                      ),
                      SizedBox(height: 5),
                      Heading2(
                        text: "Universitas Dian Nuswantoro",
                        color: Colors.black,
                      ),
                      SizedBox(height: 20),
                      Heading3(
                          text:
                              " ''Melayani dengan Sepenuh hati sesuai dengan standar ISO 9001:2015'' ",
                          color: Colors.black)
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Image.asset("images/LogoISO.png",
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Image.asset("images/LogoUdinus.png",
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
            Center(
              child: HoverButtonPrimary(
                text: "Reservasi Ruangan",
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
