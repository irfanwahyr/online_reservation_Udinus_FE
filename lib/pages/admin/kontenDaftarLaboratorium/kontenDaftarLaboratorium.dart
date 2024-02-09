import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_buttonDelete.dart';
import 'package:kp2024/models/admin/_buttonEdit.dart';

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
  List<String> Software = [
    "Software_1",
    "Software_2",
    "Software_3",
    "Software_4",
    "Software_5",
    "Software_6",
    "Software_7",
    "Software_8",
    "Software_9",
    "Software_10",
  ];
  int _no = 1; // Nomor yang akan diincrement otomatis

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
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
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.green[50],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: DataTable(
                      columns: <DataColumn>[
                        const DataColumn(
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
                        const DataColumn(
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
                        const DataColumn(
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
                        const DataColumn(
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
                        const DataColumn(
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
                        const DataColumn(
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
                        for (var i = 0; i < Software.length; i++)
                          DataColumn(
                            label: Expanded(
                              child: Center(
                                child: Text(
                                  Software[i],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        const DataColumn(
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
            ],
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
              Text(
                _no.toString(),
                style: TextStyle(fontSize: 10),
              ),
            ),
            DataCell(
              Text(
                "Laboratorium ${Laboratorium[i]}",
                style: TextStyle(fontSize: 10),
              ),
            ),
            DataCell(
              Text(
                'Jumlah PC $i',
                style: TextStyle(fontSize: 10),
              ),
            ),
            DataCell(
              Text(
                'RAM $i',
                style: TextStyle(fontSize: 10),
              ),
            ),
            DataCell(
              Text(
                'Memori $i',
                style: TextStyle(fontSize: 10),
              ),
            ),
            DataCell(
              Text(
                'VGA $i',
                style: TextStyle(fontSize: 10),
              ),
            ),
            for (var j = 0; j < Software.length; j++)
              DataCell(
                Text(
                  'Software ${j + 1}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonEdit(),
                  const SizedBox(
                    width: 5,
                  ),
                  ButtonDelete(),
                ],
              ),
            ),
          ],
        ),
      );

      _no++;
    }

    return dummyData;
  }
}
