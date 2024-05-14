// Hapus import yang tidak digunakan
import 'package:flutter/material.dart';
import 'package:kp2024/controllers/peminjaman_admin/kelaspengganti_admin.dart';
import 'package:kp2024/controllers/pesanan_user/riwayat/riwayatUser.dart';
import 'package:kp2024/models/admin/_buttonAcc.dart';
import 'package:kp2024/models/admin/_buttonDenied.dart';
import 'package:kp2024/models/buttonAlasan.dart';
import 'package:kp2024/models/reservasiModel/_buttonDiterima.dart';
import 'package:kp2024/models/reservasiModel/_buttonDitolak.dart';
import 'package:kp2024/pages/admin/editPage/editKuliahPengganti.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KuliahPenggantiAdmin extends StatefulWidget {
  const KuliahPenggantiAdmin({Key? key}) : super(key: key);

  @override
  State<KuliahPenggantiAdmin> createState() => _KuliahPenggantiAdminState();
}

class _KuliahPenggantiAdminState extends State<KuliahPenggantiAdmin> {
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
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: kuliah_pengganti_admin,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                final listkuliahPengganti = snapshot.data!;
                if (listkuliahPengganti.isEmpty) {
                  return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.90,
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
                            "Data Kelas Pengganti Kosong",
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
                        Text(
                          "DI PROSES",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
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
                            child: Scrollbar(
                              controller: verticalController,
                              thumbVisibility: true,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: SingleChildScrollView(
                                  primary: false,
                                  controller: horizontalController_1,
                                  scrollDirection: Axis.horizontal,
                                  child: SingleChildScrollView(
                                    controller: verticalController,
                                    scrollDirection: Axis
                                        .vertical, // Tambahkan axis vertikal
                                    child: Center(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
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
                                                "Nama Dosen",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                "Mata Kuliah",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                "kelompok",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                "Ruang",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                "No Whatsapp",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                "Tanggal Pinjam",
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
                                                "Keterangan",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                "Opsi",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                          rows: List.generate(
                                            listkuliahPengganti.length,
                                            (index) {
                                              final data_kuliah_pengganti =
                                                  listkuliahPengganti[index];
                                              int id = data_kuliah_pengganti.id;
                                              String nama_dosen =
                                                  data_kuliah_pengganti
                                                      .nama_dosen;
                                              String mata_kuliah =
                                                  data_kuliah_pengganti
                                                      .mata_kuliah;
                                              String kelompok =
                                                  data_kuliah_pengganti
                                                      .kelompok;
                                              String nama_lab =
                                                  data_kuliah_pengganti
                                                      .nama_lab;
                                              String no_whatsapp =
                                                  data_kuliah_pengganti
                                                      .no_whatsapp;
                                              String tanggal_pinjam =
                                                  data_kuliah_pengganti
                                                      .tanggal_mulai;
                                              String jam_mulai =
                                                  data_kuliah_pengganti
                                                      .jam_mulai;
                                              String jam_selesai =
                                                  data_kuliah_pengganti
                                                      .jam_selesai;
                                              String keterangan =
                                                  data_kuliah_pengganti
                                                      .keterangan;
                                              int id_user =
                                                  data_kuliah_pengganti.id_user;
                                              int id_jadwal =
                                                  data_kuliah_pengganti
                                                      .id_jadwal;
                                              _no++;
                                              return DataRow(cells: <DataCell>[
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      _no.toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      nama_dosen,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      mata_kuliah,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      kelompok,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      nama_lab,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      no_whatsapp,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      tanggal_pinjam,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      jam_mulai,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      jam_selesai,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      keterangan,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      ButtonAcc(
                                                        id: id,
                                                        token: token!,
                                                        nama_acara:
                                                            "Kuliah Pengganti",
                                                        nama_lab: nama_lab,
                                                        tanggal_mulai:
                                                            tanggal_pinjam,
                                                        tanggal_selesai:
                                                            tanggal_pinjam,
                                                        jam_mulai: jam_mulai,
                                                        jam_selesai:
                                                            jam_selesai,
                                                        alasan: "Diterima",
                                                        id_user: id_user,
                                                        id_jadwal: id_jadwal,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      ButtonDenied(
                                                        id: id,
                                                        token: token!,
                                                        nama_acara:
                                                            "Kuliah Pengganti",
                                                        nama_lab: nama_lab,
                                                        tanggal_mulai:
                                                            tanggal_pinjam,
                                                        tanggal_selesai:
                                                            tanggal_pinjam,
                                                        jam_mulai: jam_mulai,
                                                        jam_selesai:
                                                            jam_selesai,
                                                        id_user: id_user,
                                                        id_jadwal: id_jadwal,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }
              return Container(); // Added a default return statement
            },
          ),
          SizedBox(
            height: 30,
          ),
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
                        Text(
                          "SELESAI",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
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

  void _showConfirmPopUp(
    int id,
    String token,
    String nama_acara,
    String nama_lab,
    String tanggal_mulai,
    String tanggal_selesai,
    String jam_mulai,
    String jam_selesai,
    String alasan,
    int id_user,
    int id_jadwal,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ButtonAcc(
          id: id,
          token: token,
          nama_acara: nama_acara,
          nama_lab: nama_lab,
          tanggal_mulai: tanggal_mulai,
          tanggal_selesai: tanggal_selesai,
          jam_mulai: jam_mulai,
          jam_selesai: jam_selesai,
          alasan: alasan,
          id_user: id_user,
          id_jadwal: id_jadwal,
        );
      },
    );
  }
}
