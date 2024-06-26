import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_buttonAccKelasPengganti.dart';
import 'package:kp2024/models/admin/_buttonDeniedKelasPengganti.dart';
import 'package:kp2024/models/admin/_buttonProposal.dart';
import 'package:kp2024/models/admin/_buttonSuratPinjam.dart';
import 'package:kp2024/controllers/peminjaman_admin/acarakampus_admin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AcaraKampusAdmin extends StatefulWidget {
  const AcaraKampusAdmin({Key? key}) : super(key: key);

  @override
  State<AcaraKampusAdmin> createState() => _AcaraOrganisasiAdminState();
}

class _AcaraOrganisasiAdminState extends State<AcaraKampusAdmin> {
  final ScrollController controller = ScrollController();
  final ScrollController controller_2 = ScrollController();
  Future<List<AdminAcaraKampus>> acara_kampus_admin = fetchdata();
  String? token;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    acara_kampus_admin = fetchdata();
    String? token = prefs.getString('token');
    setState(() {
      this.token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: acara_kampus_admin,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            final listacarakampus = snapshot.data!;
            if (listacarakampus.isEmpty) {
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Colors.green[50],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        "Data Acara Kampus Kosong",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              int _no = 0;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "DIPROSES",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Center(
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
                          child: Scrollbar(
                            controller: controller_2,
                            thumbVisibility: true,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SingleChildScrollView(
                                controller: controller_2,
                                scrollDirection: Axis.horizontal,
                                child: SingleChildScrollView(
                                  controller: controller,
                                  child: Center(
                                    child: DataTable(
                                      columns: const <DataColumn>[
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "No",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "Fakultas",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "Penanggung Jawab",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "No Whatsapp",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "Nama Acara",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "Ruang",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "Tanggal\nmulai",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "Tanggal\nSelesai",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "Jam Mulai",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "Jam Selesai",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "Keterangan",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "Surat",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Center(
                                              child: Text(
                                                "Opsi",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      rows: List.generate(
                                          listacarakampus.length, (index) {
                                        final data_acara_kampus =
                                            listacarakampus[index];
                                        String fakultas =
                                            data_acara_kampus.fakultas;
                                        String penanggung_jawab =
                                            data_acara_kampus.penanggung_jawab;
                                        String no_whatssapp =
                                            data_acara_kampus.no_whatsapp;
                                        String nama_acara =
                                            data_acara_kampus.nama_acara;
                                        String nama_lab =
                                            data_acara_kampus.nama_lab;
                                        String tanggal_mulai =
                                            data_acara_kampus.tanggal_mulai;
                                        String tanggal_selesai =
                                            data_acara_kampus.tanggal_selesai;
                                        String jam_mulai =
                                            data_acara_kampus.jam_mulai;
                                        String jam_selesai =
                                            data_acara_kampus.jam_selesai;
                                        String keterangan =
                                            data_acara_kampus.keterangan;
                                        String proposal_acara =
                                            data_acara_kampus.proposal_acara;
                                        String surat_peminjaman =
                                            data_acara_kampus.surat_peminjaman;
                                        _no++;
                                        return DataRow(cells: <DataCell>[
                                          DataCell(
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  _no.toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  fakultas,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  penanggung_jawab,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  no_whatssapp,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  nama_acara,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  nama_lab,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  tanggal_mulai,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  tanggal_selesai,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  jam_mulai,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  jam_selesai,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  keterangan,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(Row(
                                            children: [
                                              Tooltip(
                                                message: 'Proposal',
                                                child: ButtonProposal(
                                                    proposal_acara:
                                                        proposal_acara),
                                              ),
                                              const Text(" | "),
                                              Tooltip(
                                                message: 'Surat pinjam',
                                                child: ButtonSuratPinjam(
                                                    surat_peminjaman:
                                                        surat_peminjaman),
                                              ),
                                            ],
                                          )),
                                          DataCell(Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              // ButtonAcc(),
                                              SizedBox(width: 10),
                                              // ButtonDenied(),
                                            ],
                                          )),
                                        ]);
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              );
            }
          }
          return Container(); // Added to handle all paths in the function
        },
      ),
    );
  }
}
