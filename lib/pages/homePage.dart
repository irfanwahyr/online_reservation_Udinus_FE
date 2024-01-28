import 'package:flutter/material.dart';
import 'package:kp2024/models/_buttonPrimary.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/dashboard/lapisan1.dart';
import 'package:kp2024/pages/dashboard/lapisan2.dart';
import 'package:kp2024/pages/dashboard/lapisan3.dart';
import 'package:kp2024/pages/dashboard/lapisan4.dart';
import 'package:kp2024/pages/logSign.dart';

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
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Heading2(
                    text: "Selamat Datang",
                    color: Colors.white,
                  ),
                  HoverButtonPrimary(
                    text: "Daftar/Login",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogSign(),
                        ),
                      );
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
