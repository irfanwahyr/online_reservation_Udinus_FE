import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/admin/_buttonDelete.dart';
import 'package:kp2024/models/admin/_buttonEdit.dart';
import 'package:kp2024/pages/admin/daftarMataKuliah.dart';
import 'package:kp2024/pages/admin/editPage/editDaftarMataKuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JadwalHari extends StatefulWidget {
  static const nameRoute = "/JadwalHari";
  const JadwalHari({Key? key}) : super(key: key);

  @override
  State<JadwalHari> createState() => _JadwalHariState();
}

class _JadwalHariState extends State<JadwalHari> {
  String? nama_lab;
  String? hari;
  List<String> waktu_mulai = [
    "07.00",
    "07.40",
    "08.40",
    "10.20",
    "11.10",
    "12.30",
    "13.20",
    "14.10",
    "15.30",
    "16.20",
    "17.10",
    "18.30",
    "19.20",
    "20.10",
  ];

  List<String> waktu_selesai = [
    "07.40",
    "08.40",
    "09.30",
    "11.10",
    "12.00",
    "13.20",
    "14.10",
    "15.00",
    "16.20",
    "17.10",
    "18.00",
    "19.20",
    "20.10",
    "21.00",
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nama_lab = prefs.getString('nama_lab');
    String? hari = prefs.getString('hari');

    setState(() {
      this.nama_lab = nama_lab;
      this.hari = hari;
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
      body: Center(
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
                          // DataColumn(
                          //   label: Expanded(
                          //     child: Center(
                          //       child: Text(
                          //         "Laboratorium",
                          //         textAlign: TextAlign.center,
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 10,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
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
                        rows: _generateDummyData(),
                      ),
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

  List<DataRow> _generateDummyData() {
    List<DataRow> dummyData = [];

    for (int i = 0; i < waktu_mulai.length; i++) {
      dummyData.add(
        DataRow(
          cells: <DataCell>[
            // DataCell(
            //   Center(
            //     child: Text(
            //       'Laboratorium $nama_lab $hari',
            //       style: TextStyle(fontSize: 10),
            //     ),
            //   ),
            // ),
            DataCell(
              Center(
                child: Text(
                  waktu_mulai[i],
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  waktu_selesai[i],
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Nama Matkul $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Kelompok $i',
                  style: TextStyle(fontSize: 10),
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
                        '$hari',
                        '$nama_lab',
                        waktu_mulai[i],
                        waktu_selesai[i],
                        'Nama Matkul $i',
                        'Kelompok $i',
                        'Dosen Pengampu $i',
                      );
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ButtonDelete(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return dummyData;
  }

  void _showEditFormPopup(
    String hari,
    String nama_lab,
    String waktu_mulai,
    String waktu_selesai,
    String mata_kuliah,
    String kelompok,
    String nama_dosen,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditDaftarMataKuliah(
          hari: hari,
          nama_lab: nama_lab,
          waktu_mulai: waktu_mulai,
          waktu_selesai: waktu_selesai,
          mata_kuliah: mata_kuliah,
          kelompok: kelompok,
          nama_dosen: nama_dosen,
        );
      },
    );
  }
}
