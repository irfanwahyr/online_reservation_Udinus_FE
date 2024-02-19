import 'package:flutter/material.dart';
import 'package:kp2024/models/detailLabModel/_containerDetailLab.dart';
import 'package:kp2024/models/detailLabModel/_hardware.dart';
import 'package:kp2024/models/detailLabModel/_software.dart';
import 'package:kp2024/models/detailLabModel/_spesifikasiLab.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';
import 'package:shared_preferences/shared_preferences.dart';



class DetailA extends StatefulWidget {
  static const nameRoute = 'detailA';
  const DetailA({super.key});

  @override
  State<DetailA> createState() => _DetailAState();
}

class _DetailAState extends State<DetailA> {

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width > 1200;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContainerDetailLab(
              laboratorium: "LABORATORIUM \nMULTIMEDIA",
              namaLab: "40",
              imageAsset: "images/gambar.jpg",
              onpressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setString('data', "");
                          Navigator.pushNamed(context, Reservasi.nameRoute);
                        },
            ),
            SpesifikasiDetailLab(
              namaLab: '',
              jumlahPc: '',
            ),
            isScreenWide
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Hardware(
                        processor: "",
                        ram: "",
                        vga: "",
                        mouse: "",
                        monitor: "",
                        keyboard: "",
                      ),
                      Software(
                        software_1: "",
                        software_2: "",
                        software_3: "",
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Hardware(
                        processor: "",
                        ram: "",
                        vga: "",
                        mouse: "",
                        monitor: "",
                        keyboard: "",
                      ),
                      Software(
                        software_1: "",
                        software_2: "",
                        software_3: "",
                      ),
                    ],
                  ),
            const SizedBox(
              height: 30,
            ),
            Footer().buildContainer()
          ],
        ),
      ),
    );
  }
}
