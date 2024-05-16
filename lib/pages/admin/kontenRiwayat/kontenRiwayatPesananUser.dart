// Hapus import yang tidak digunakan
import 'package:flutter/material.dart';
import 'package:kp2024/controllers/peminjaman_admin/kelaspengganti_admin.dart';
import 'package:kp2024/controllers/pesanan_user/riwayat/riwayatUser.dart';
import 'package:kp2024/models/admin/_buttonAccKelasPengganti.dart';
import 'package:kp2024/models/admin/_buttonDeniedKelasPengganti.dart';
import 'package:kp2024/models/buttonAlasan.dart';
import 'package:kp2024/models/reservasiModel/_buttonDiterima.dart';
import 'package:kp2024/models/reservasiModel/_buttonDitolak.dart';
import 'package:kp2024/pages/admin/editPage/editKuliahPengganti.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KontenRiwayatPesananUser extends StatefulWidget {
  const KontenRiwayatPesananUser({Key? key}) : super(key: key);

  @override
  State<KontenRiwayatPesananUser> createState() =>
      _KontenRiwayatPesananUserState();
}

class _KontenRiwayatPesananUserState extends State<KontenRiwayatPesananUser> {
  final ScrollController verticalController = ScrollController();
  final ScrollController horizontalController_1 = ScrollController();
  final ScrollController horizontalController_2 = ScrollController();
  Future<List<KelasPenggantiAdmin>> kuliah_pengganti_admin = fetchdata();
  Future<List<RiwayatUser>> riwayat_user = getDataAll();
  String? token;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    kuliah_pengganti_admin = fetchdata();
    riwayat_user = getDataAll();
    String? token = prefs.getString('token');
    setState(() {
      this.token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      primary: false,
      child: Column(
        children: [
          FutureBuilder(
            future: riwayat_user,
            builder: (context, snapshot) {
              print(snapshot);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                final listRiwayatUser = snapshot.data!;
                if (listRiwayatUser.isEmpty) {
                  return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        color: Colors.green[50],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            "Data Riwayat User Kosong",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  int _no = 0; // Nomor yang akan diincrement otomatis
                  return Center(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: Colors.green[50],
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SingleChildScrollView(
                                child: Center(
                                  child: DataTable(
                                    columns: const <DataColumn>[
                                      DataColumn(
                                        label: Text(
                                          "No",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "Keperluan",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "Ruangan",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "Tanggal Mulai",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "Tanggal Selesai",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "Jam Mulai",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "Jam Selesai",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "Status",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "Alasan",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows: List.generate(listRiwayatUser.length,
                                        (index) {
                                      final dataRiwayatUser =
                                          listRiwayatUser[index];
                                      int id = dataRiwayatUser.id;
                                      String keperluan =
                                          dataRiwayatUser.nama_acara;
                                      String nama_lab =
                                          dataRiwayatUser.nama_lab;
                                      String tanggal_mulai =
                                          dataRiwayatUser.tanggal_mulai;
                                      String tanggal_selesai =
                                          dataRiwayatUser.tanggal_selesai;
                                      String jam_mulai =
                                          dataRiwayatUser.jam_mulai;
                                      String jam_selesai =
                                          dataRiwayatUser.jam_selesai;
                                      bool status = dataRiwayatUser.status;
                                      String alasan = dataRiwayatUser.alasan;
                                      _no++;
                                      return DataRow(cells: <DataCell>[
                                        DataCell(
                                          Center(
                                            child: Text(
                                              _no.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(
                                              keperluan,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(
                                              nama_lab,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(
                                              tanggal_mulai,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(
                                              tanggal_selesai,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(
                                              jam_mulai,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(
                                              jam_selesai,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        DataCell(Row(
                                          children: [
                                            status == true
                                                ? ButtonDiterima()
                                                : ButtonDitolak(),
                                          ],
                                        )),
                                        DataCell(Center(
                                          child: ButtonAlasan(alasan: alasan),
                                        ))
                                      ]);
                                    }),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  );
                }
              }
              return Container(); // Added a default return statement
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    ));
  }

}
