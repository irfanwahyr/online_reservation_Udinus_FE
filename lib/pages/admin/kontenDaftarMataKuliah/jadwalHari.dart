import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/admin/_buttonDelete.dart';
import 'package:kp2024/models/admin/_buttonEdit.dart';
import 'package:kp2024/pages/admin/editPage/editDaftarMataKuliah.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JadwalHari extends StatefulWidget {
  static const nameRoute = "/JadwalHari";

  const JadwalHari({Key? key}) : super(key: key);

  @override
  State<JadwalHari> createState() => _JadwalHariState();
}

class _JadwalHariState extends State<JadwalHari> {
  String? namaLabAdmin;
  String? hariAdmin;
  List<String> WaktuMulai = [
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

  List<String> WaktuSelesai = [
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
    String? namaLabAdmin = prefs.getString('namaLabAdmin');
    String? hariAdmin = prefs.getString('hariAdmin');

    setState(() {
      this.namaLabAdmin = namaLabAdmin;
      this.hariAdmin = hariAdmin;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    final ScrollController controller_2 = ScrollController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Heading1(
            text: "Jadwal Laboratorium $namaLabAdmin $hariAdmin",
            color: Colors.black),
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
                          DataColumn(
                            label: Expanded(
                              child: Center(
                                child: Text(
                                  "Laboratorium",
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
                                  "Kode Kelas",
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
                                  "Dosen Pengampu",
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

    for (int i = 0; i < WaktuMulai.length; i++) {
      dummyData.add(
        DataRow(
          cells: <DataCell>[
            DataCell(
              Center(
                child: Text(
                  'Laboratorium $namaLabAdmin $hariAdmin',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  WaktuMulai[i],
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  WaktuSelesai[i],
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
                  'Kode Kelas $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Dosen Pengampu $i',
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
                        '$hariAdmin',
                        '$namaLabAdmin',
                        WaktuMulai[i],
                        WaktuSelesai[i],
                        'Nama Matkul $i',
                        'Kode Kelas $i',
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
    String namaLab,
    String waktuMulai,
    String waktuSelesai,
    String namaMatkul,
    String kodeKelas,
    String dosenPengampu,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditDaftarMataKuliah(
          hari: hari,
          namaLab: namaLab,
          waktuMulai: waktuMulai,
          waktuSelesai: waktuSelesai,
          namaMatkul: namaMatkul,
          kodeKelas: kodeKelas,
          dosenPengampu: dosenPengampu,
        );
      },
    );
  }
}
