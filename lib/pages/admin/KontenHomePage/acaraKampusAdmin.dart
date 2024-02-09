import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_buttonAcc.dart';
import 'package:kp2024/models/admin/_buttonDenied.dart';
import 'package:kp2024/models/admin/_buttonFile.dart';

class AcaraKampusAdmin extends StatefulWidget {
  const AcaraKampusAdmin({Key? key}) : super(key: key);

  @override
  State<AcaraKampusAdmin> createState() => _AcaraKampusAdminState();
}

class _AcaraKampusAdminState extends State<AcaraKampusAdmin> {
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                                    fontWeight: FontWeight.bold, fontSize: 10),
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
                                "Proposal",
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
                                "Surat Pinjam",
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
                                "Opsi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
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
      ),
    );
  }

  List<DataRow> _generateDummyData() {
    List<DataRow> dummyData = [];

    for (int i = 0; i < 10; i++) {
      dummyData.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              _no.toString(),
              style: TextStyle(fontSize: 10),
            )),
            DataCell(Text(
              'Organisasi $i',
              style: TextStyle(fontSize: 10),
            )),
            DataCell(Text(
              'Penanggung Jawab $i',
              style: TextStyle(fontSize: 10),
            )),
            DataCell(Text(
              'No Whatsapp $i',
              style: TextStyle(fontSize: 10),
            )),
            DataCell(Text(
              'Nama Acara $i',
              style: TextStyle(fontSize: 10),
            )),
            DataCell(Text(
              'Ruang $i',
              style: TextStyle(fontSize: 10),
            )),
            DataCell(Text(
              'Tanggal Mulai $i',
              style: TextStyle(fontSize: 10),
            )),
            DataCell(Text(
              'Tanggal Selesai $i',
              style: TextStyle(fontSize: 10),
            )),
            DataCell(Text(
              'Jam Mulai $i',
              style: TextStyle(fontSize: 10),
            )),
            DataCell(Text(
              'Jam Selesai $i',
              style: TextStyle(fontSize: 10),
            )),
            DataCell(Text(
              'Keterangan $i',
              style: TextStyle(fontSize: 10),
            )),
            DataCell(ButtonFile()),
            DataCell(ButtonFile()),
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
        ),
      );

      _no++;
    }

    return dummyData;
  }
}
