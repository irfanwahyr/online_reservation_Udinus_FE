import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/admin/_buttonEdit.dart';
import 'package:kp2024/pages/admin/daftarMataKuliah.dart';
import 'package:kp2024/pages/admin/editPage/editDaftarMataKuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kp2024/controllers/jadwal/show_jadwal_admin.dart';

class JadwalHari extends StatefulWidget {
  static const nameRoute = "/JadwalHari";

  const JadwalHari({Key? key}) : super(key: key);

  @override
  State<JadwalHari> createState() => _JadwalHariState();
}

class _JadwalHariState extends State<JadwalHari> {
  String? nama_lab;
  String? hari;
  String? token;
  Future<List<ShowJadwalMingguanAdmin>> listJadwalAdmin = fetchdata("");
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nama_lab = prefs.getString('nama_lab');
    String? hari = prefs.getString('hari');
    int? id_hari = prefs.getInt('id_hari');
    String? token = prefs.getString('token');

    setState(() {
      listJadwalAdmin = fetchdata(id_hari.toString());
      this.nama_lab = nama_lab;
      this.hari = hari;
      this.token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    final ScrollController controller_2 = ScrollController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 1, 24, 50),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, DaftarMataKuliah.nameRoute);
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Heading1(
            text: "Jadwal Laboratorium $nama_lab $hari",
            color: const Color.fromARGB(255, 255, 255, 255)),
      ),
      body: FutureBuilder(
        future: listJadwalAdmin,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            final jadwal = snapshot.data!;

            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width >= 1300
                    ? MediaQuery.of(context).size.width * 0.75
                    : MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Colors.green[50],
                ),
                child: Center(
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
                                        "Jam Mulai",
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
                                        "Jam Selesai",
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
                                        "Nama Matkul",
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
                                        "Kelompok",
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
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              rows: List.generate(jadwal.length, (index) {
                                final jadwal_idx = jadwal[index];
                                int id = jadwal_idx.id;
                                String jamMulai = jadwal_idx.jam_mulai;
                                String jamSelesai = jadwal_idx.jam_selesai;
                                String mata_kuliah = jadwal_idx.mata_kuliah;
                                String kelompok = jadwal_idx.kelompok;
                                int id_hari = jadwal_idx.id_hari;
                                return DataRow(cells: <DataCell>[
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          jamMulai,
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
                                          jamSelesai,
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ButtonEdit(
                                          onPressed: () {
                                            _showEditFormPopup(
                                              mata_kuliah,
                                              kelompok,
                                              token!,
                                              jamMulai,
                                              jamSelesai,
                                              id,
                                              id_hari
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]);
                              }, growable: true),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  void _showEditFormPopup(
    String? mata_kuliah,
    String? kelompok,
    String? token,
    String? jam_mulai,
    String? jam_selesai,
    int? id,
    int? id_hari
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditDaftarMataKuliah(
          mata_kuliah: mata_kuliah!,
          kelompok: kelompok!,
          token: token!,
          id: id!,
          jam_mulai: jam_mulai!,
          jam_selesai: jam_selesai!,
          id_hari: id_hari!,
        );
      },
    );
  }
}