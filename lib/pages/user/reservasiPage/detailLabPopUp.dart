import 'package:flutter/material.dart';
import 'package:kp2024/controllers/detail_lab/detail_lab.dart' as detailLab;
import 'package:kp2024/models/detailLabModel/_spesifikasiLab.dart';

class DetailLabPopUp {
  static Future<bool?> show(BuildContext context, String nama_lab) async {
    bool isScreenWide = MediaQuery.of(context).size.width > 1200;

    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(224, 0, 0, 0),
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(146, 84, 221, 239),
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                "Detail Laboratorium $nama_lab",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder<detailLab.DetailLab>(
              future: detailLab
                  .fetchdata(), // Menggunakan fetchdata dari detail_lab.dart
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  String nama_lab = snapshot.data!.nama_lab;
                  String jumlah_pc = snapshot.data!.jumlah_pc.toString();
                  int id = snapshot.data!.id;
                  // List<String> software = snapshot.data!.software
                  //     .map((software) =>
                  //         '-${software['software_1']}\n-${software['software_2']}\n-${software['software_3']}\n-${software['software_4']}\n-${software['software_5']}')
                  //     .toList();

                  // List<String> hardware = snapshot.data!.hardware
                  //     .map((hardware) =>
                  //         'Processor: ${hardware['processor']}\nram: ${hardware['ram']}\ngpu: ${hardware['gpu']}\nmonitor: ${hardware['monitor']}\nstorage: ${hardware['storage']}\n')
                  //     .toList();

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SpesifikasiDetailLab(
                        nama_lab: nama_lab,
                        jumlah_pc: jumlah_pc,
                      ),
                    ],
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Tutup")),
          ],
        );
      },
    );
  }
}
