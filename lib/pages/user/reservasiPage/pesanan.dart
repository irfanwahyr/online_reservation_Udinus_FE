import 'package:flutter/material.dart';
import 'package:kp2024/controllers/pesanan_user/pesananAcaraKampus.dart';
import 'package:kp2024/controllers/pesanan_user/pesananAcaraOrganisasi.dart';
import 'package:kp2024/controllers/pesanan_user/pesananKuliahPengganti.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/models/admin/_buttonAcc.dart';
import 'package:kp2024/models/admin/_buttonDenied.dart';
import 'package:kp2024/models/admin/_buttonEditKecil.dart';
import 'package:kp2024/models/admin/buttonDeleteKecil.dart';
import 'package:kp2024/models/reservasiModel/_buttonDiterima.dart';
import 'package:kp2024/models/reservasiModel/_buttonDitolak.dart';
import 'package:kp2024/models/reservasiModel/_buttonSelesai.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pesanan extends StatefulWidget {
  static const nameRoute = "/Pesanan";
  const Pesanan({Key? key}) : super(key: key);

  @override
  State<Pesanan> createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {

  Future<List<PesananKuliahPengganti>> pesanan_kuliah_pengganti = getDataKuliahPengganti("");
  Future<List<PesananAcaraOrganisasi>> pesanan_acara_organisasi = getDataAcaraOrganisasi("");
  Future<List<PesananAcaraKampus>> pesanan_acara_kampus = getDataAcaraKampus("");
  String? user_id = "";
  String? token;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getInt('id_user').toString();
    String? token = prefs.getString('token');
    setState(() {
      this.user_id = user_id;
      this.token = token;
    });
    pesanan_kuliah_pengganti = getDataKuliahPengganti(user_id);
    pesanan_acara_organisasi = getDataAcaraOrganisasi(user_id);
    pesanan_acara_kampus = getDataAcaraKampus(user_id);
  }
  List<String> status = [
    "0",
    "0",
    "0",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
  ];
   // Nomor yang akan diincrement otomatis
  final ScrollController controller = ScrollController();
  final ScrollController controller_2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([
          pesanan_kuliah_pengganti,
          pesanan_acara_organisasi,
          pesanan_acara_kampus
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError){
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData){
            int _no = 0;
            final listkuliah_pengganti = snapshot.data![0];
            final listacara_organisasi = snapshot.data![1];
            final listacara_kampus = snapshot.data![2];

            final jumlahKuliahPengganti = (listkuliah_pengganti as List).length;
            final jumlahAcaraOrganisasi = (listacara_organisasi as List).length;
            final jumlahAcaraKampus = (listacara_kampus as List).length;

            final maxRows = jumlahAcaraKampus + jumlahAcaraOrganisasi + jumlahKuliahPengganti;

            return  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width >= 1300
                    ? MediaQuery.of(context).size.width * 0.6
                    : MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Colors.green[50],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(164, 25, 161, 239),
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 15, left: 15, top: 5, bottom: 5),
                            child: Heading2(
                              text: "DI PROSES",
                              color: Colors.white,
                            ),
                          ),
                        )),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          controller: controller_2,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
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
                                        "Keperluan",
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
                                        "Ruangan",
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
                                        "Tanggal Mulai",
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
                                        "Tanggal Selesai",
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
                              rows: List<DataRow>.generate(maxRows, (index) {
                                _no++;
                                if(index < jumlahKuliahPengganti){
                                    final datakuliahpengganti = listkuliah_pengganti[index];
                                    return DataRow(cells: <DataCell>[
                                    DataCell(
                                      Center(
                                        child: Text(
                                          _no.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          "Kuliah Pengganti",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          datakuliahpengganti.nama_lab,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          datakuliahpengganti.tanggal_mulai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          datakuliahpengganti.tanggal_mulai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          datakuliahpengganti.jam_mulai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          datakuliahpengganti.jam_selesai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ButtonEditKecil(onTap: () {
                                            // print("di edit");
                                          }),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          ButtonDeletedKecil(onTap: (){

                                            deletePesananKuliahPengganti(datakuliahpengganti.id, datakuliahpengganti.id_jadwal, token!, datakuliahpengganti.jam_mulai, datakuliahpengganti.jam_selesai);
                                          }),
                                        ],
                                      ),
                                    ),
                                  ]);
                                }
                                else if (index < jumlahKuliahPengganti + jumlahAcaraOrganisasi){
                                  final dataIndex = index - jumlahKuliahPengganti;
                                  final dataacaraorganisasi = listacara_organisasi[dataIndex];
                                  return DataRow(cells: <DataCell>[
                                    DataCell(
                                      Center(
                                        child: Text(
                                          _no.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          dataacaraorganisasi.nama_acara,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          dataacaraorganisasi.nama_lab,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          dataacaraorganisasi.tanggal_mulai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          dataacaraorganisasi.tanggal_selesai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          dataacaraorganisasi.jam_mulai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          dataacaraorganisasi.jam_selesai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ButtonEditKecil(onTap: () {
                                            // print("di edit");
                                          }),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          ButtonDeletedKecil(onTap: (){
                                            deletePesananAcaraOrganisasi(index.toString(), token!);
                                          }),
                                        ],
                                      ),
                                    ),
                                  ]);
                                }
                                else{
                                  final dataIndex = index - (jumlahKuliahPengganti + jumlahAcaraOrganisasi);
                                  final dataacarakampus = listacara_kampus[dataIndex];
                                  return DataRow(cells: <DataCell>[
                                    DataCell(
                                      Center(
                                        child: Text(
                                          _no.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          dataacarakampus.nama_acara,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          dataacarakampus.nama_lab,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          dataacarakampus.tanggal_mulai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          dataacarakampus.tanggal_selesai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          dataacarakampus.jam_mulai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          dataacarakampus.jam_selesai,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ButtonEditKecil(onTap: () {
                                            print("di edit");
                                          }),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          ButtonDeletedKecil(onTap: () async {
                                            await deletePesananAcaraKampus(index.toString(), token!);
                                          }),
                                        ],
                                      ),
                                    ),
                                  ]);
                                }
                              }),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width >= 1300
                    ? MediaQuery.of(context).size.width * 0.6
                    : MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Colors.green[50],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(164, 25, 161, 239),
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 15, left: 15, top: 5, bottom: 5),
                            child: Heading2(
                              text: "RIWAYAT USER",
                              color: Colors.white,
                            ),
                          ),
                        )),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          controller: controller_2,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
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
                                        "Keperluan",
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
                                        "Ruangan",
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
                                        "Acara",
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
                                        "Tanggal Mulai",
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
                                        "Tanggal Selesai",
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
                                        "Status",
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
                              rows: _generateDummyData2(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Footer().buildContainer()
          ],
        ),
      );
          }
          return const Center(
            child: Text("Tidak ada data"),
          );
        },
      ),
    );
  }

  List<DataRow> _generateDummyData() {
    int _no = 1;
    List<DataRow> dummyData = [];

    for (int i = 0; i < 5; i++) {
      dummyData.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Text(_no.toString())),
            DataCell(Text('Keperluan $i')),
            DataCell(Text('Acara $i')),
            DataCell(Text('Nama Lab $i')),
            DataCell(Text('Tgl Mulai $i')),
            DataCell(Text('Tgl Selesai $i')),
            DataCell(Text('Jam Mulai $i')),
            DataCell(Text('Jam Selesai $i')),
            DataCell(Row(
              children: [
                ButtonEditKecil(
                  onTap: () {
                    print("di edit");
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                ButtonDeletedKecil(
                  onTap: () {
                  },
                )
              ],
            )),
          ],
        ),
      );

      _no++;
    }

    return dummyData;
  }

  List<DataRow> _generateDummyData2() {
    int _no = 1;
    List<DataRow> dummyData = [];

    for (int j = 0; j < 5; j++) {
      dummyData.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Text(_no.toString())),
            DataCell(Text('Keperluan $j')),
            DataCell(Text('Acara $j')),
            DataCell(Text('Nama Lab $j')),
            DataCell(Text('Tgl Mulai $j')),
            DataCell(Text('Tgl Selesai $j')),
            DataCell(Text('Jam Mulai $j')),
            DataCell(Text('Jam Selesai $j')),
            DataCell(Row(
              children: [
                status[j] == "0" ? ButtonDiterima() : ButtonDitolak(),
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
