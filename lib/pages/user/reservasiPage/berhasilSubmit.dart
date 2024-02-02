import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/models/_heading3.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/homePage.dart';

class BerhasilSubmit extends StatelessWidget {
  static const nameRoute = 'BerhasilSubmit';
  const BerhasilSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/BerhasilDiBooked.png'),
                SizedBox(width: 20),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Heading1(text: "Berhasil Terkirim", color: Colors.black),
                      Heading2(
                        text: "menunggu Konfirmasi Admin 1x24 Jam",
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Untuk Konfirmasi atau Pertanyaan silahkan Kontak ke admnin di whatsapp",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/iconWhatsappWarna.png'),
                SizedBox(width: 20),
                Text(
                  "087654789301",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, HomePage.nameRoute);
              },
              style: ElevatedButton.styleFrom(
                // Set the background color to green
                primary: Colors.green,
              ),
              child: Text(
                "Home",
                style: TextStyle(
                    color: Colors.white), // Keep the text color as white
              ),
            ),
            SizedBox(height: 30),
            Footer().buildContainer(),
          ],
        ),
      ),
    );
  }
}
