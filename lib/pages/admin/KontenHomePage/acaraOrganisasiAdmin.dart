import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_buttonAcc.dart';
import 'package:kp2024/models/admin/_buttonDenied.dart';
import 'package:kp2024/models/admin/_buttonProposal.dart';
import 'package:kp2024/models/admin/_buttonSuratPinjam.dart';
import 'package:kp2024/controllers/peminjaman_admin/acaraorganisasi_admin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AcaraOrganisasiAdmin extends StatefulWidget {
  const AcaraOrganisasiAdmin({Key? key}) : super(key: key);

  @override
  State<AcaraOrganisasiAdmin> createState() => _AcaraOrganisasiAdminState();
}

class _AcaraOrganisasiAdminState extends State<AcaraOrganisasiAdmin> {
  final ScrollController controller = ScrollController();
  final ScrollController controller_2 = ScrollController();
  Future<List<AdminAcaraOrganisasi>> acara_organisasi_admin = fetchdata();
  String? token;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    acara_organisasi_admin = fetchdata();
    String? token = prefs.getString('token');
    setState(() {
      this.token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: acara_organisasi_admin,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            final listacaraorganisasi = snapshot.data!;
            int _no = 0; // Nomor yang akan diincrement otomatis
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Colors.green[50],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Scrollbar(
                    controller: controller_2,
                    thumbVisibility: true,
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
                                          fontWeight: FontWeight.bold, fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                    child: Text(
                                      "Organisasi",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 10),
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
                                          fontWeight: FontWeight.bold, fontSize: 10),
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
                                          fontWeight: FontWeight.bold, fontSize: 10),
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
                                          fontWeight: FontWeight.bold, fontSize: 10),
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
                                          fontWeight: FontWeight.bold, fontSize: 10),
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
                                          fontWeight: FontWeight.bold, fontSize: 10),
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
                                          fontWeight: FontWeight.bold, fontSize: 10),
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
                                          fontWeight: FontWeight.bold, fontSize: 10),
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
                                          fontWeight: FontWeight.bold, fontSize: 10),
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
                                          fontWeight: FontWeight.bold, fontSize: 10),
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
                                          fontWeight: FontWeight.bold, fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            rows: List.generate(listacaraorganisasi.length, (index) {
                              final data_acara_organisasi = listacaraorganisasi[index];
                              int id = data_acara_organisasi.id;
                              String nama_organisasi = data_acara_organisasi.nama_organisasi;
                              String penanggung_jawab = data_acara_organisasi.penanggung_jawab;
                              String no_whatssapp = data_acara_organisasi.no_whatsapp;
                              String nama_acara = data_acara_organisasi.nama_acara;
                              String nama_lab = data_acara_organisasi.nama_lab;
                              String tanggal_mulai = data_acara_organisasi.tanggal_mulai;
                              String tanggal_selesai = data_acara_organisasi.tanggal_selesai;
                              String jam_mulai = data_acara_organisasi.jam_mulai;
                              String jam_selesai = data_acara_organisasi.jam_selesai;
                              String keterangan = data_acara_organisasi.keterangan;
                              String proposal_acara = data_acara_organisasi.proposal_acara;
                              String surat_peminjaman = data_acara_organisasi.surat_peminjaman;
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
                                        nama_organisasi,
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
                                      child: ButtonProposal(proposal_acara: proposal_acara),
                                    ),
                                    Text(" | "),
                                    Tooltip(
                                      message: 'Surat pinjam',
                                      child: ButtonSuratPinjam(),
                                    ),
                                  ],
                                )),
                                DataCell(Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ButtonDenied(),
                                    SizedBox(width: 5),
                                    ButtonAcc(),
                                    SizedBox(width: 5),
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
            );
          }
          return Container(); // Added to handle all paths in the function
        },
      ),
    );
  }
}
