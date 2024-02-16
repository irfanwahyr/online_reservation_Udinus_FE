import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_buttonDelete.dart';
import 'package:kp2024/models/admin/_buttonEdit.dart';
import 'package:kp2024/pages/admin/editPage/editDaftarLaboratorium.dart';

class KontenDaftarLaboratorium extends StatefulWidget {
  const KontenDaftarLaboratorium({Key? key}) : super(key: key);

  @override
  State<KontenDaftarLaboratorium> createState() =>
      _KontenDaftarLaboratoriumState();
}

class _KontenDaftarLaboratoriumState extends State<KontenDaftarLaboratorium> {
  List<String> Laboratorium = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
  ];

  int _no = 1; // Nomor yang akan diincrement otomatis

  @override
  Widget build(BuildContext context) {
  final ScrollController controller = ScrollController();
  final ScrollController controller_2 = ScrollController();
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.95,
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
                              "No",
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
                              "Jumlah PC",
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
                              "RAM",
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
                              "Memori",
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
                              "VGA",
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
                              'Software 1',
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
                              'Software 2',
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
                              'Software 3',
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
                              'Software 4',
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
                              'Software 5',
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
                              'Software 6',
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
                              'Software 7',
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
                              'Software 8',
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
                              'Software 9',
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
                              'Software 10',
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
  );
}


  List<DataRow> _generateDummyData() {
    List<DataRow> dummyData = [];

    for (int i = 0; i < Laboratorium.length; i++) {
      dummyData.add(
        DataRow(
          cells: <DataCell>[
            DataCell(
              Center(
                child: Text(
                  _no.toString(),
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  "Laboratorium ${Laboratorium[i]}",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Jumlah PC $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'RAM $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Memori $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'VGA $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Software1 $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Software2 $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Software3 $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Software4 $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Software5 $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Software6 $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Software7 $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Software8 $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Software9 $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  'Software10 $i',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonEdit(
                      onPressed: () {
                        _showEditFormPopup(
                            'Laboratorium ${Laboratorium[i]}',
                            'Jumlah PC $i',
                            'Jumlah RAM $i',
                            'Jumlah Memori $i',
                            'Jumlah VGA $i',
                            'Software1 $i',
                            'Software2 $i',
                            'Software3 $i',
                            'Software4 $i',
                            'Software5 $i',
                            'Software6 $i',
                            'Software7 $i',
                            'Software8 $i',
                            'Software9 $i',
                            'Software10 $i');
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ButtonDelete(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

      _no++;
    }

    return dummyData;
  }

  void _showEditFormPopup(
    String laboratorium,
    String jumlahPc,
    String ram,
    String memori,
    String vga,
    String software1,
    String software2,
    String software3,
    String software4,
    String software5,
    String software6,
    String software7,
    String software8,
    String software9,
    String software10,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditDaftarLaboratorium(
          laboratorium: laboratorium,
          jumlahPc: jumlahPc,
          ram: ram,
          memori: memori,
          vga: vga,
          software1: software1,
          software2: software2,
          software3: software3,
          software4: software4,
          software5: software5,
          software6: software6,
          software7: software7,
          software8: software8,
          software9: software9,
          software10: software10,
        );
      },
    );
  }
}
