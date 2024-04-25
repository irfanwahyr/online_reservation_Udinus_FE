import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kp2024/controllers/jadwal/show_jadwal.dart';
import 'package:kp2024/models/_heading6.dart';
import 'package:kp2024/models/reservasiModel/_buttonDipakai.dart';
import 'package:kp2024/models/reservasiModel/_buttonDiproses.dart';
import 'package:kp2024/models/reservasiModel/_buttonReservasi.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/user/reservasiPage/keperluan.dart';
import 'package:kp2024/pages/user/reservasiPage/listReservasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservasiContent extends StatefulWidget {
  const ReservasiContent({Key? key}) : super(key: key);

  @override
  State<ReservasiContent> createState() => _ReservasiContentState();
}

class _ReservasiContentState extends State<ReservasiContent> {
  final ScrollController controller = ScrollController();
  final ScrollController controller_2 = ScrollController();
  DateTime today = DateTime.now();
  // DateTime? tanggalYangDipilih;
  ListReservasi listReservasi = ListReservasi();
  String? nama_lab;
  String labName = 'A';
  int? datePilihan;
  String selectedDate = "";
  Future<List<ShowJadwalMingguan>> listJadwal = fetchdata("","");

  late DateTime tanggalYangDipilih;

  @override
  void initState() {
    tanggalYangDipilih = DateTime.now();
    if (today.weekday == DateTime.sunday) {
      tanggalYangDipilih = today;
    }
    listJadwal = fetchdata(today.weekday.toString(), labName.toString());
    super.initState();
    // Check if today is Sunday
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime firstSelectableDate = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: tanggalYangDipilih,
      firstDate: firstSelectableDate,
      lastDate: DateTime.utc(2040, 3, 14),
      selectableDayPredicate: (DateTime date) {
        // Return true if the date is in the future from today
        return date.isAfter(DateTime.now().subtract(Duration(days: 1)));
      },
    );

    if (pickedDate != null && pickedDate != today) {
      setState(() {
        tanggalYangDipilih = pickedDate;
        // Memanggil fetchdata() saat tanggal diubah
        listJadwal = fetchdata(pickedDate.weekday.toString(), labName.toString());
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth > 900 ? 200.0 : 150.0;
    double buttonHeight = screenWidth > 900 ? 80.0 : 60.0;
    double fontSize = screenWidth > 900 ? 20.0 : 16.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: listJadwal,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print("Masuk error menunggu koneksi");
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print("Masuk error snapshot");
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  print("Masuk snapshot punya data");
                  final jadwal = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Heading6(
                            text: "RESERVASI RUANGAN LABORATORIUM",
                            color: Colors.black,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (labName != null) {
                                    print('Nilai yang dipilih: $labName');
                                  } else {
                                    print('Tidak ada nilai yang dipilih!');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(buttonWidth, buttonHeight),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Pilih Laboratorium",
                                      style: TextStyle(fontSize: fontSize),
                                    ),
                                    SizedBox(width: 5),
                                    DropdownButtonHideUnderline(
                                      // Menghilangkan underline
                                      child: DropdownButton<String>(
                                        dropdownColor:
                                            Color.fromARGB(211, 255, 255, 255),
                                        value: labName,
                                        onChanged: (String? newValue) async {
                                          if (newValue != null) {
                                            SharedPreferences prefs = await SharedPreferences.getInstance();
                                            await prefs.setString('nama_lab', newValue);
                                            labName = newValue;
                                            setState(() {
                                              labName = newValue;
                                            });
                                            // Memanggil fetchdata() saat nama lab diubah
                                            listJadwal = fetchdata(tanggalYangDipilih.weekday.toString(), labName.toString());
                                          }
                                        },
                                        icon: Icon(Icons
                                            .arrow_drop_down_circle_outlined),
                                        style: TextStyle(
                                          fontSize: fontSize,
                                          color: Color.fromARGB(211, 0, 0, 0),
                                        ),
                                        items: <String>[
                                          'A',
                                          'B',
                                          'C',
                                          'D',
                                          'E',
                                          'G',
                                          'H',
                                          'I',
                                          'J',
                                          'K',
                                          'L',
                                          'M',
                                          'N'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  return ElevatedButton.icon(
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                    icon: const Icon(Icons.calendar_today),
                                    label: Text(
                                      "Pilih Tanggal",
                                      style: TextStyle(fontSize: fontSize),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize:
                                          Size(buttonWidth, buttonHeight),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(213, 6, 6, 146),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Anda Memilih Laboratorium $labName dengan tanggal ${listReservasi.getHari(tanggalYangDipilih.weekday)}, ${tanggalYangDipilih.day} ${listReservasi.getBulan(tanggalYangDipilih.month)} ${tanggalYangDipilih.year}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          tanggalYangDipilih.weekday == DateTime.sunday
                              ? Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.green[50],
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Center(
                                      child: Text(
                                        'Hari Minggu tidak ada jadwal',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.green[50],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Scrollbar(
                                      controller: controller_2,
                                      thumbVisibility: true,
                                      child: SingleChildScrollView(
                                        controller: controller_2,
                                        scrollDirection: Axis.horizontal,
                                        child: SingleChildScrollView(
                                          controller: controller,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: _calculateSizedBoxWidth(
                                                    context),
                                                child: DataTable(
                                                  columns: const <DataColumn>[
                                                    DataColumn(
                                                      label: Expanded(
                                                        child: Center(
                                                          child: Text(
                                                            "Waktu",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20,
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
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Expanded(
                                                        child: Center(
                                                          child: Text(
                                                            "Pesan",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  rows: List.generate(
                                                    jadwal.length,
                                                    (index) {
                                                      final jadwal_idx =
                                                          jadwal[index];
                                                      String jamMulai =
                                                          jadwal_idx.jam_mulai;
                                                      String jamSelesai =
                                                          jadwal_idx
                                                              .jam_selesai;
                                                      String waktuText =
                                                          "$jamMulai - $jamSelesai";
                                                      return DataRow(
                                                        cells: <DataCell>[
                                                          DataCell(
                                                            Center(
                                                              child: FittedBox(
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                                child: Text(
                                                                  waktuText,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          DataCell(
                                                            Center(
                                                              child: FittedBox(
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                                child: Text(
                                                                  "${jadwal_idx.mata_kuliah}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          DataCell(
                                                            Center(
                                                              child:
                                                                  getPesanButtons(
                                                                jadwal_idx
                                                                    .id_pesan,
                                                                jadwal_idx.id,
                                                                jadwal_idx
                                                                    .id_hari,
                                                                jamMulai,
                                                                jamSelesai,
                                                                jadwal_idx
                                                                    .mata_kuliah,
                                                                jadwal_idx
                                                                    .kelompok,
                                                              )[index],
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                    growable: true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Text("No data");
                }
              },
            ),
            Footer().buildContainer()
          ],
        ),
      ),
    );
  }

  double _calculateSizedBoxWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 900) {
      return screenWidth * 0.8;
    } else {
      return screenWidth * 1.5;
    }
  }

  List<Widget> getPesanButtons(
    int id_pesan,
    int id,
    int id_hari,
    String jam_mulai,
    String jam_selesai,
    String mata_kuliah,
    String kelompok,
  ) {
    List<Widget> buttons = [];

    for (int i = 0; i < 15; i++) {
      switch (id_pesan.toString()) {
        case "1":
        buttons.add(
            const ButtonDipakai(),
          );
         

          break;
        case "2":
         buttons.add(
            ButtonReservasi(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString(
                    'nama_lab', labName.toString());
                String tanggal_mulai = tanggalYangDipilih != 0
                    ? DateFormat('dd-MM-yyyy').format(tanggalYangDipilih)
                    : DateFormat('dd-MM-yyyy').format(today);
                await prefs.setString('tanggal_mulai', tanggal_mulai);
                await prefs.setString('jam_mulai', jam_mulai);
                await prefs.setString('jam_selesai', jam_selesai);
                await prefs.setInt('id_pesan', id_pesan);
                await prefs.setInt('id_matkul', id);
                await prefs.setInt('id_hari', id_hari);
                await prefs.setString('default_mata_kuliah', mata_kuliah);
                await prefs.setString('default_kelompok', kelompok);
                Navigator.pushNamed(context, Keperluan.nameRoute);
              },
            ),
          );
          
          break;
        case "3":
          buttons.add(
            const ButtonDiproses(),
          );
          break;
        default:
          break;
      }
    }

    return buttons;
  }
}
