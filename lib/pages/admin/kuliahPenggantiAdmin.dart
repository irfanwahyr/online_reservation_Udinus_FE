import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_buttonAcc.dart';
import 'package:kp2024/models/admin/_buttonDenied.dart';

class KuliahPenggantiAdmin extends StatefulWidget {
  const KuliahPenggantiAdmin({Key? key}) : super(key: key);

  @override
  State<KuliahPenggantiAdmin> createState() => _KuliahPenggantiAdminState();
}

class _KuliahPenggantiAdminState extends State<KuliahPenggantiAdmin> {
  int _no = 1; // Nomor yang akan diincrement otomatis

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        color: Colors.green[50],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Colors.green[50],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                                  fontWeight: FontWeight.bold, fontSize: 13),
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
                                  fontWeight: FontWeight.bold, fontSize: 13),
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
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Text(
                              "Kode",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
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
                                  fontWeight: FontWeight.bold, fontSize: 13),
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
                                  fontWeight: FontWeight.bold, fontSize: 13),
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
                                  fontWeight: FontWeight.bold, fontSize: 13),
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
                                  fontWeight: FontWeight.bold, fontSize: 13),
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
                                  fontWeight: FontWeight.bold, fontSize: 13),
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
                                  fontWeight: FontWeight.bold, fontSize: 13),
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
                                  fontWeight: FontWeight.bold, fontSize: 13),
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
          ],
        ),
      ),
    );
  }

  List<DataRow> _generateDummyData() {
    List<DataRow> dummyData = [];

    for (int i = 0; i < 10; i++) {
      dummyData.add(DataRow(
        cells: <DataCell>[
          DataCell(Text(_no.toString())),
          DataCell(Text('Dosen $i')),
          DataCell(Text('Mata Kuliah $i')),
          DataCell(Text('Kode $i')),
          DataCell(Text('Ruang $i')),
          DataCell(Text('No Whatsapp $i')),
          DataCell(Text('Tanggal Pinjam $i')),
          DataCell(Text('Jam Mulai $i')),
          DataCell(Text('Jam Selesai $i')),
          DataCell(Text('Keterangan $i')),
          DataCell(Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonDenied(),
              SizedBox(
                width: 5,
              ),
              ButtonAcc(),
            ],
          )),
        ],
      ));

      _no++;
    }

    return dummyData;
  }
}
