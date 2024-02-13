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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.73,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: Colors.green[50],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                          "Kode",
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
              SizedBox(width: 5),
              ButtonAcc(),
              SizedBox(width: 5),
              ButtonEditKecil(
                onTap: () {
                  _showEditFormPopup(
                    'Dosen $i',
                    'Mata Kuliah $i',
                    'Kode $i',
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
    String dosen,
    String mataKuliah,
    String kode,
    String ruang,
    String noWhatsapp,
    String tanggalPinjam,
    String jamMulai,
    String jamSelesai,
    String keterangan,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditKuliahPengganti(
          dosen: dosen,
          mataKuliah: mataKuliah,
          kode: kode,
          ruang: ruang,
          noWhatsapp: noWhatsapp,
          tanggalPinjam: tanggalPinjam,
          jamMulai: jamMulai,
          jamSelesai: jamSelesai,
          keterangan: keterangan,
        );
      },
    );
  }
}
