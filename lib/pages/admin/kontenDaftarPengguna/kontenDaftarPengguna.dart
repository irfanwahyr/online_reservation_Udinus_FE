import 'package:flutter/material.dart';
import 'package:kp2024/models/admin/_buttonDelete.dart';
import 'package:kp2024/models/admin/_buttonEdit.dart';
import 'package:kp2024/pages/admin/editPage/editDaftarPengguna.dart';
import 'package:kp2024/controllers/users/users_data.dart';

class KontenDaftarPengguna extends StatefulWidget {
  static const nameRoute = "/KontenDaftarPengguna";
  const KontenDaftarPengguna({Key? key}) : super(key: key);

  @override
  State<KontenDaftarPengguna> createState() => _KontenDaftarPenggunaState();
}

class _KontenDaftarPenggunaState extends State<KontenDaftarPengguna> {
  
  final ScrollController controller = ScrollController();
  final ScrollController controller_2 = ScrollController();
  Future<List<ShowDataUsers>> listUsers = fetchdata();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      listUsers = fetchdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: listUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            final listuser = snapshot.data!;
            int _no = 0; // Nomor yang akan diincrement otomatis
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width >= 1300
              ? MediaQuery.of(context).size.width * 0.6
              : MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Colors.green[50],
                ),
                child: Align(
                  alignment: Alignment.topCenter,
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
                                        "Role",
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
                              rows: List.generate(listuser.length, (index) {
                                final user = listuser[index];
                                bool role = user.role;
                                int id = user.id;
                                String is_admin = role ? "Admin" : "User";
                                String username = user.username;
                                String email = user.email;
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
                                          username,
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
                                          email,
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
                                          is_admin,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
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
          return Container(); // Add a default return if none of the conditions are met
        },
      ),
    );
  }
}
