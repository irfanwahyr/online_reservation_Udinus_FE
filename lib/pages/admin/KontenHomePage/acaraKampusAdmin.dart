import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_buttonAcc.dart';
import 'package:kp2024/models/admin/_buttonDenied.dart';
import 'package:kp2024/models/admin/_buttonEditKecil.dart';
import 'package:kp2024/models/admin/_buttonProposal.dart';
import 'package:kp2024/models/admin/_buttonSuratPinjam.dart';
import 'package:kp2024/pages/admin/editPage/editAcaraKampus.dart';

class AcaraKampusAdmin extends StatefulWidget {
  const AcaraKampusAdmin({Key? key}) : super(key: key);

  @override
  State<AcaraKampusAdmin> createState() => _AcaraKampusAdminState();
}

class _AcaraKampusAdminState extends State<AcaraKampusAdmin> {
  int _no = 1; // Nomor yang akan diincrement otomatis
  final ScrollController controller = ScrollController();
  final ScrollController controller_2 = ScrollController();

  @override
  Widget build(BuildContext context) {
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
                                "Surat",
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
              'Fakultas $i',
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
            // DataCell(Row(
            //   children: [
            //     Tooltip(
            //       message: 'Proposal',
            //       child: ButtonProposal(),
            //     ),
            //     Text(" | "),
            //     Tooltip(
            //       message: 'Surat pinjam',
            //       child: ButtonSuratPinjam(),
            //     ),
            //   ],
            // )),
            DataCell(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonDenied(),
                SizedBox(width: 5),
                ButtonAcc(),
                SizedBox(width: 5),
                ButtonEditKecil(
                  onTap: () {
                    _showEditFormPopup(
                      'Fakultas $i',
                      'Penanggung jawab $i',
                      'No Whatsapp $i',
                      'Nama Acara $i',
                      'Ruang $i',
                      'Tanggal Mulai $i',
                      'Tanggal Selesai $i',
                      'Jam Mulai $i',
                      'Jam Selesai $i',
                      'Keterangan $i',
                    );
                  },
                ),
              ],
            )),
          ],
        ),
      );

      _no++;
    }

    return dummyData;
  }

  void _showEditFormPopup(
    String fakultas,
    String penanggung_jawab,
    String no_whatsapp,
    String nama_acara,
    String nama_lab,
    String tanggal_mulai,
    String tanggal_selesai,
    String jam_mulai,
    String jam_selesai,
    String keterangan,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditAcaraKampus(
          fakultas: fakultas,
          penanggung_jawab: penanggung_jawab,
          no_whatsapp: no_whatsapp,
          nama_acara: nama_acara,
          nama_lab: nama_lab,
          tanggal_mulai: tanggal_mulai,
          tanggal_selesai: tanggal_selesai,
          jam_mulai: jam_mulai,
          jam_selesai: jam_selesai,
          keterangan: keterangan,
        );
      },
    );
  }
}
