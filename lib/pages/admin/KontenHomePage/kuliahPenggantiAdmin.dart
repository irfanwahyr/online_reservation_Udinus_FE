import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_buttonAcc.dart';
import 'package:kp2024/models/admin/_buttonDenied.dart';
import 'package:kp2024/models/admin/_buttonEditKecil.dart';
import 'package:kp2024/pages/admin/editPage/editKuliahPengganti.dart';

class KuliahPenggantiAdmin extends StatefulWidget {
  const KuliahPenggantiAdmin({Key? key}) : super(key: key);

  @override
  State<KuliahPenggantiAdmin> createState() => _KuliahPenggantiAdminState();
}

class _KuliahPenggantiAdminState extends State<KuliahPenggantiAdmin> {
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
                    rows: _generateDummyData(),
                  ),
                  ),
                ),
              ),
            ),
        ),
      )
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
          DataCell(Text('kelompok $i')),
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
              SizedBox(width: 5),
              ButtonAcc(),
              SizedBox(width: 5),
              ButtonEditKecil(
                onTap: () {
                  _showEditFormPopup(
                    'Dosen $i',
                    'Mata Kuliah $i',
                    'kelompok $i',
                    'Ruang $i',
                    'No Whatsapp $i',
                    'Tanggal Pinjam $i',
                    'Jam Mulai $i',
                    'Jam Selesai $i',
                    'Keterangan $i',
                  );
                },
              ),
            ],
          )),
        ],
      ));

      _no++;
    }

    return dummyData;
  }

  void _showEditFormPopup(
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
          nama_dosen: nama_dosen,
          mata_kuliah: mata_kuliah,
          kelompok: kelompok,
          nama_lab: nama_lab,
          no_whatsapp: no_whatsapp,
          tanggal_pinjam: tanggal_pinjam,
          jam_mulai: jam_mulai,
          jam_selesai: jam_selesai,
          keterangan: keterangan,
        );
      },
    );
  }
}
