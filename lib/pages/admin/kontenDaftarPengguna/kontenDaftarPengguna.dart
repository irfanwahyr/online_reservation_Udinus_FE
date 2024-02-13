import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_buttonDelete.dart';
import 'package:kp2024/models/admin/_buttonEdit.dart';
import 'package:kp2024/pages/admin/editPage/addDataPengguna.dart';
import 'package:kp2024/pages/admin/editPage/editDaftarPengguna.dart';

class KontenDaftarPengguna extends StatefulWidget {
  static const nameRoute = "/KontenDaftarPengguna";
  const KontenDaftarPengguna({Key? key}) : super(key: key);

  @override
  State<KontenDaftarPengguna> createState() => _KontenDaftarPenggunaState();
}

class _KontenDaftarPenggunaState extends State<KontenDaftarPengguna> {
  int _no = 1; // Nomor yang akan diincrement otomatis

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Center(
                          child: DataTable(
                            headingRowHeight: 50,
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
                                      "Nama Lengkap",
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
                                      "Email",
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
                                      "Password",
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
                                      "Action",
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
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          right: 50,
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(161, 71, 203, 75),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddDataPengguna();
                },
              );
            },
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  List<DataRow> _generateDummyData() {
    List<DataRow> dummyData = [];

    for (int i = 0; i < 10; i++) {
      dummyData.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Text(_no.toString())),
            DataCell(Text('Nama Pengguna $i')),
            DataCell(Text('Email$i@gmail.com')),
            DataCell(Text('Password $i')),
            DataCell(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonEdit(
                  onPressed: () {
                    _showEditFormPopup(
                      'Nama Pengguna $i',
                      'Email$i@gmail.com',
                      'Password $i',
                    );
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                ButtonDelete(),
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
    String namaPengguna,
    String email,
    String password,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditDaftarPengguna(
          namaPengguna: namaPengguna,
          email: email,
          password: password,
        );
      },
    );
  }
}
