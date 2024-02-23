import 'package:flutter/material.dart';
import 'package:kp2024/controllers/detail_lab/detail_lab.dart';
import 'package:kp2024/models/detailLabModel/_containerDetailLab.dart';
import 'package:kp2024/models/detailLabModel/_hardware.dart';
import 'package:kp2024/models/detailLabModel/_software.dart';
import 'package:kp2024/models/detailLabModel/_spesifikasiLab.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailLaboratorium extends StatefulWidget {
  static const nameRoute = 'DetailLaboratorium';
  const DetailLaboratorium({Key? key});

  @override
  State<DetailLaboratorium> createState() => _DetailLaboratoriumState();
}

class _DetailLaboratoriumState extends State<DetailLaboratorium> {

  late Future<DetailLab> labData;

  @override
  void initState() {
    super.initState();
    labData = fetchdata();
  }
  

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width > 1200;

    return Scaffold(
      body: FutureBuilder<DetailLab>(
        future: labData,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            String namaLab = snapshot.data!.nama;
            String jml_pc = snapshot.data!.jml_PC.toString();
            int id = snapshot.data!.id;
            List<String> softwareNames = snapshot.data!.softwarePrimers
              .map((software) => software['nama'] as String)
              .toList();

            return SingleChildScrollView(
              child: Column(
                children: [
                  ContainerDetailLab(
                    laboratorium: "LABORATORIUM \nMULTIMEDIA",
                    namaLab: namaLab,
                    imageAsset: "images/gambar.jpg",
                    onpressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('data', id.toString());
                      await prefs.setString('namaLab', namaLab);
                      Navigator.pushNamed(context, Reservasi.nameRoute);
                    },
                  ),
                  SpesifikasiDetailLab(
                    namaLab: namaLab,
                    jumlahPc: jml_pc,
                  ),
                  isScreenWide
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Hardware(
                        processor: "Intel I7 7700F ",
                        ram: "16",
                        vga: "RTX 4090",
                        mouse: "Logitech K40",
                        monitor: "LG K789H",
                        keyboard: "Logitech K490",
                      ),
                      Software(
                        softwareNames: softwareNames,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const Hardware(
                        processor: "Intel I7 7700F ",
                        ram: "16",
                        vga: "RTX 4090",
                        mouse: "Logitech K40",
                        monitor: "LG K789H",
                        keyboard: "Logitech K490",
                      ),
                      Software(
                        softwareNames: softwareNames,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Footer().buildContainer()
                ],
              ),
            );
        } else {
          return const Center(child: Text('No data available'));
        }
      }),
    );
  }
}
