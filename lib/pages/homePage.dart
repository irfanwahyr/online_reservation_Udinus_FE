import 'package:flutter/material.dart';
import 'package:kp2024/models/_buttonPrimary.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/pages/homepage/footer.dart';
import 'package:kp2024/pages/homepage/lapisan1.dart';
import 'package:kp2024/pages/homepage/lapisan2.dart';
import 'package:kp2024/pages/homepage/lapisan3.dart';
import 'package:kp2024/pages/homepage/lapisan4.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          // width: double.maxFinite,
          height: 200,
          color: const Color.fromARGB(255, 1, 24, 50),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Heading2(
                  text: "Selamat Datang",
                  color: Colors.white,
                ),
                HoverButtonPrimary(
                  text: "Daftar/Login",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lapisan1().buildContainer(),
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
