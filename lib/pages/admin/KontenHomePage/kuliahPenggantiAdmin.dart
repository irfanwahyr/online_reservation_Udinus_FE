import 'package:flutter/material.dart';
import 'package:kp2024/controllers/peminjaman_admin/kelaspengganti_admin.dart';
import 'package:kp2024/models/admin/_buttonAcc.dart';
import 'package:kp2024/models/admin/_buttonDenied.dart';
import 'package:kp2024/models/admin/_buttonEdit.dart';
import 'package:kp2024/models/admin/_buttonEditKecil.dart';
import 'package:kp2024/pages/admin/editPage/editKuliahPengganti.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KuliahPenggantiAdmin extends StatefulWidget {
  const KuliahPenggantiAdmin({Key? key}) : super(key: key);

  @override
  State<KuliahPenggantiAdmin> createState() => _KuliahPenggantiAdminState();
}

class _KuliahPenggantiAdminState extends State<KuliahPenggantiAdmin> {
  final ScrollController controller = ScrollController();
  final ScrollController controller_2 = ScrollController();
  Future<List<KelasPenggantiAdmin>> kuliah_pengganti_admin = fetchdata();
  String? token;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    kuliah_pengganti_admin = fetchdata();
    String? token = prefs.getString('token');
    setState(() {
      this.token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: kuliah_pengganti_admin,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            final listkuliahPengganti = snapshot.data!;
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                    child: Text(
                                      "Nama Dosen",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                    child: Text(
                                      "Mata Kuliah",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                    child: Text(
                                      "kelompok",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
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
                                        fontSize: 13,
                                      ),
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
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                    child: Text(
                                      "Tanggal Pinjam",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
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
                                        fontSize: 13,
                                      ),
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
                                        fontSize: 13,
                                      ),
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
                                        fontSize: 13,
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
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            rows: List.generate(listkuliahPengganti.length,
                                (index) {
                              final data_kuliah_pengganti =
                                  listkuliahPengganti[index];
                              int id = data_kuliah_pengganti.id;
                              String nama_dosen =
                                  data_kuliah_pengganti.nama_dosen;
                              String mata_kuliah =
                                  data_kuliah_pengganti.mata_kuliah;
                              String kelompok = data_kuliah_pengganti.kelompok;
                              String nama_lab = data_kuliah_pengganti.nama_lab;
                              String no_whatsapp =
                                  data_kuliah_pengganti.no_whatsapp;
                              String tanggal_pinjam =
                                  data_kuliah_pengganti.tanggal_mulai;
                              String jam_mulai =
                                  data_kuliah_pengganti.jam_mulai;
                              String jam_selesai =
                                  data_kuliah_pengganti.jam_selesai;
                              String keterangan =
                                  data_kuliah_pengganti.keterangan;
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
                                        nama_dosen,
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
                                        mata_kuliah,
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
                                        kelompok,
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
                                        no_whatsapp,
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
                                        tanggal_pinjam,
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
                                DataCell(
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ButtonDenied(),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      ButtonEditKecil(
                                        onTap: () {
                                          _showEditFormPopup(
                                              token ?? "",
                                              id,
                                              nama_dosen,
                                              mata_kuliah,
                                              kelompok,
                                              nama_lab,
                                              no_whatsapp,
                                              tanggal_pinjam,
                                              jam_mulai,
                                              jam_selesai,
                                              keterangan);
                                        },
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      ButtonAcc(),
                                    ],
                                  ),
                                ),
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
          return Container(); // Added a default return statement
        },
      ),
    );
  }

  void _showEditFormPopup(
    String token,
    int id,
    String nama_dosen,
    String mata_kuliah,
    String kelompok,
    String nama_lab,
    String no_whatsapp,
    String tanggal_pinjam,
    String jam_mulai,
    String jam_selesai,
    String keterangan,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditKuliahPengganti(
          token: token,
          id: id,
          nama_dosen: nama_dosen,
          mata_kuliah: mata_kuliah,
          kelompok: kelompok,
          nama_lab: nama_lab,
          no_whatsapp: no_whatsapp,
          tanggal_pinjam: tanggal_pinjam,
          jam_mulai: jam_mulai,
          jam_selesai: jam_selesai,
          keterangan: keterangan,
          // Tambahkan parameter futureDataEditKuliahPengganti untuk memperbarui data setelah edit
          futureDataEditKuliahPengganti: fetchdata(),
        );
      },
    );
  }
}
