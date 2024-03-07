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
            String nama_lab = snapshot.data!.nama_lab;
            String jumlah_pc = snapshot.data!.jumlah_pc.toString();
            int id = snapshot.data!.id;
            List<String> software = snapshot.data!.software
              .map((software) => software['nama_software'] as String)
              .toList();
            List<String> hardware = snapshot.data!.hardware
              .map((hardware) =>
                'Processor: ${hardware['processor']}\nram: ${hardware['ram']}\ngpu: ${hardware['gpu']}\nmonitor: ${hardware['monitor']}\nstorage: ${hardware['storage']}\n'
              )
              .toList();

            // List<Map<String, dynamic>> hardwareList = List.generate(snapshot.data!.hardware.length, (index) {
            //   String processor = snapshot.data!.hardware[index]['processor'] ?? "";
            //   int ram = snapshot.data!.hardware[index]['ram'] ?? 0;
            //   String gpu = snapshot.data!.hardware[index]['gpu'] ?? "";
            //   int monitor = snapshot.data!.hardware[index]['monitor'] ?? 0;
            //   String storage = snapshot.data!.hardware[index]['storage'] ?? "";
            //   return {
            //     'processor': processor,
            //     'ram': ram,
            //     'gpu': gpu,
            //     'monitor': monitor,
            //     'storage': storage,
            //   };
            // });

            // String gpu = hardwareList[0]['gpu'] ?? "tidak ada";
            // String processor = hardwareList[0]['processor'] ?? "tidak ada";
            // int ram = hardwareList[0]['ram'] ?? 0;
            // int monitor = hardwareList[0]['monitor'] ?? 0;
            // String storage = hardwareList[0]['storage'] ?? "tidak ada";

            return SingleChildScrollView(
              child: Column(
                children: [
                  ContainerDetailLab(
                    jenis_lab: "LABORATORIUM \nMULTIMEDIA",
                    nama_lab: nama_lab,
                    imageAsset: "images/gambar.jpg",
                    onpressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('data', id.toString());
                      await prefs.setString('nama_lab', nama_lab);
                      Navigator.pushNamed(context, Reservasi.nameRoute);
                    },
                  ),
                  SpesifikasiDetailLab(
                    nama_lab: nama_lab,
                    jumlah_pc: jumlah_pc,
                  ),
                  isScreenWide
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Hardware(
                        hardwareNames: hardware,
                      ),
                      Software(
                        softwareNames: software,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Hardware(
                        hardwareNames: hardware,
                      ),
                      Software(
                        softwareNames: software,
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
