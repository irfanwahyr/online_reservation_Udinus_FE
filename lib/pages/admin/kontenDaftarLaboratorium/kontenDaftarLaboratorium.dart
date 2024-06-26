import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_buttonDelete.dart';
import 'package:kp2024/models/admin/_buttonEdit.dart';
import 'package:kp2024/pages/admin/editPage/editDaftarLaboratorium.dart';
import 'package:kp2024/controllers/lab_admin/data_lab_admin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KontenDaftarLaboratorium extends StatefulWidget {
  const KontenDaftarLaboratorium({Key? key}) : super(key: key);

  @override
  State<KontenDaftarLaboratorium> createState() =>
      _KontenDaftarLaboratoriumState();
}

class _KontenDaftarLaboratoriumState
    extends State<KontenDaftarLaboratorium> {
  int _no = 0;
  Future<List<LabData>> listLabAdmin = fetchdata();
  String? token;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    setState(() {
      listLabAdmin = fetchdata();
      this.token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    final ScrollController controller_2 = ScrollController();
    return Scaffold(
      body: FutureBuilder(
        future: listLabAdmin,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            final listLab = snapshot.data!;

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
                                        "Jenis Lab",
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
                                        "Processor",
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
                                        "GPU",
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
                                        "Monitor",
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
                                        "Storage",
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
                              rows: List.generate(listLab.length, (index) {
                                final labAdmin = listLab[index];
                                String nama_lab = labAdmin.nama_lab;
                                int jumlah_pc = labAdmin.jumlah_pc;
                                String jenis_lab = labAdmin.jenis_lab;
                                List<Map<String, dynamic>> software = labAdmin.software;
                                List<Map<String, dynamic>> hardware = labAdmin.hardware;
                                String processor = hardware.isNotEmpty ? hardware[0]["processor"] : "N/A";
                                String ram = hardware.isNotEmpty ? hardware[0]["ram"].toString() : "N/A";
                                String gpu = hardware.isNotEmpty ? hardware[0]["gpu"] : "N/A";
                                String monitor = hardware.isNotEmpty ? hardware[0]["monitor"].toString() : "N/A";
                                String storage = hardware.isNotEmpty ? hardware[0]["storage"] : "N/A";
                                String software_1 = software.isNotEmpty ? software[0]["software_1"] : "N/A";
                                String software_2 = software.isNotEmpty ? software[0]["software_2"] : "N/A";
                                String software_3 = software.isNotEmpty ? software[0]["software_3"] : "N/A";
                                String software_4 = software.isNotEmpty ? software[0]["software_4"] : "N/A";
                                String software_5 = software.isNotEmpty ? software[0]["software_5"] : "N/A";
                                int id = software.isNotEmpty ? software[0]["id"] : 0;
                                int id_lab = software.isNotEmpty ? software[0]["id_lab"] : 0;
                                
                                _no++;
                                return DataRow(cells: <DataCell>[
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          _no.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          nama_lab,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          jumlah_pc.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          jenis_lab,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          processor,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          ram,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          gpu,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          monitor,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          storage,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          software_1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          software_2,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          software_3,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          software_4,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          software_5,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ButtonEdit(
                                          onPressed: () {
                                            _showEditFormPopup(
                                              id,
                                              id_lab,
                                              token,
                                              nama_lab,
                                              jumlah_pc,
                                              jenis_lab,
                                              processor,
                                              ram,
                                              gpu,
                                              monitor,
                                              storage,
                                              software_1,
                                              software_2,
                                              software_3,
                                              software_4,
                                              software_5,
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]);
                              }, growable: true),
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
          return Container();
        },
      ),
    );
  }

  void _showEditFormPopup(
    int id,
    int id_lab,
    String? token,
    String nama_lab,
    int jumlah_pc,
    String jenis_lab,
    String processor,
    String ram,
    String gpu,
    String monitor,
    String storage,
    String software1,
    String software2,
    String software3,
    String software4,
    String software5,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditDaftarLaboratorium(
          id: id,
          id_lab: id_lab,
          token: token!,
          nama_lab: nama_lab,
          jumlah_pc: jumlah_pc,
          jenis_lab: jenis_lab,
          processor: processor,
          ram: ram,
          gpu: gpu,
          monitor: monitor,
          storage: storage,
          software1: software1,
          software2: software2,
          software3: software3,
          software4: software4,
          software5: software5,
        );
      },
    );
  }
}
