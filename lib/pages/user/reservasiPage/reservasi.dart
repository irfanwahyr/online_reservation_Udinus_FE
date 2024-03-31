import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:kp2024/controllers/jadwal/convert_datanamalab.dart';
import 'package:kp2024/controllers/jadwal/show_jadwal.dart';
import 'package:kp2024/models/_appBarBack.dart';
import 'package:kp2024/models/_heading5.dart';
import 'package:kp2024/models/_heading6.dart';
import 'package:kp2024/models/reservasiModel/_buttonBatalkan.dart';
import 'package:kp2024/models/reservasiModel/_buttonDipakai.dart';
import 'package:kp2024/models/reservasiModel/_buttonDipesan.dart';
import 'package:kp2024/models/reservasiModel/_buttonDiproses.dart';
import 'package:kp2024/models/reservasiModel/_buttonReservasi.dart';
import 'package:kp2024/pages/user/reservasiPage/keperluan.dart';
import 'package:kp2024/pages/user/reservasiPage/listReservasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reservasi extends StatefulWidget {
  static const nameRoute = "/Reservasi";

  const Reservasi({Key? key}) : super(key: key);

  @override
  State<Reservasi> createState() => _ReservasiState();
}

class _ReservasiState extends State<Reservasi> {
  final ScrollController controller = ScrollController();
  final ScrollController controller_2 = ScrollController();
  DateTime today = DateTime.now();
  DateTime? _selectedDate;
  ListReservasi listReservasi = ListReservasi();
  String? nama_lab;
  String? labName;
  int? datePilihan;
  String selectedDateText = "";
  Future<List<ShowJadwalMingguan>> listJadwal = fetchdata("");

  @override
  void initState() {
    super.initState();
    // Cek apakah hari ini adalah Minggu
    if (today.weekday == DateTime.sunday) {
      // Jika ya, atur _selectedDate ke hari Minggu
      _selectedDate = today;
      setSelectedDateText(today);
    }
    listJadwal = fetchdata(today.weekday.toString());
    setSelectedDateText(today);
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nama_lab = prefs.getString('nama_lab');

    setState(() {
      listJadwal = fetchdata(today.weekday.toString());
      this.nama_lab = nama_lab;
    });
  }

  void setSelectedDateText(DateTime date) {
    setState(() {
      selectedDateText = "Anda memilih hari: ${listReservasi.getHari(date.weekday)}, ${date.day} ${listReservasi.getBulan(date.month)} ${date.year}";
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    // Menghitung tanggal pertama yang dapat dipilih
    DateTime firstSelectableDate = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? firstSelectableDate,
      firstDate: firstSelectableDate,
      lastDate: DateTime.utc(2040, 3, 14),
      selectableDayPredicate: (DateTime date) {
        // Mengembalikan true jika tanggal masih di masa depan dari tanggal hari ini
        return date.isAfter(DateTime.now().subtract(Duration(days: 1)));
      },
    );

    if (pickedDate != null && pickedDate != today) {
      setState(() {
        _selectedDate = pickedDate;
        setSelectedDateText(pickedDate);
        listJadwal = fetchdata(pickedDate.weekday.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBarBack(onPressed: Navigator.pushNamed(context,  )).buildAppBar(context),
      body: FutureBuilder(
      future: listJadwal,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData) {
          final jadwal = snapshot.data!;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Heading5(
                        text:
                            "Reservasi Ruangan Laboratorium $nama_lab",
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Heading6(
                      text: "JADWAL LABORATORIUM",
                      color: Colors.black,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            double screenWidth =
                                MediaQuery.of(context).size.width;
                            double buttonWidth =
                                screenWidth > 900 ? 200.0 : 150.0;
                            double buttonHeight =
                                screenWidth > 900 ? 80.0 : 60.0;
                            double fontSize = screenWidth > 900 ? 20.0 : 16.0;

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
                                minimumSize: Size(buttonWidth, buttonHeight),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 20),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            double screenWidth =
                                MediaQuery.of(context).size.width;
                            double buttonWidth =
                                screenWidth > 900 ? 200.0 : 150.0;
                            double buttonHeight =
                                screenWidth > 900 ? 72.0 : 53.0;
                            double fontSize = screenWidth > 900 ? 20.0 : 16.0;

                            return Container(
                              width: buttonWidth,
                              height: buttonHeight,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 168, 7),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: Text(
                                  _selectedDate != null
                                      ? DateFormat('dd-MM-yyyy')
                                          .format(_selectedDate!)
                                      : DateFormat('dd-MM-yyyy').format(today),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSize,
                                  ),
                                ),
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
                        selectedDateText,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _selectedDate != null && _selectedDate!.weekday == DateTime.sunday
                        ? Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
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
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
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
                                          width:
                                              _calculateSizedBoxWidth(context),
                                          child: DataTable(
                                            columns: const <DataColumn>[
                                              DataColumn(
                                                label: Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      "Waktu",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                            FontWeight.bold,
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
                                                            FontWeight.bold,
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
                                                final jadwal_idx = jadwal[index];
                                                String jamMulai = jadwal_idx.jam_mulai;
                                                String jamSelesai = jadwal_idx.jam_selesai;
                                                String waktuText = "$jamMulai - $jamSelesai";
                                                return DataRow(
                                                  cells: <DataCell>[
                                                    DataCell(
                                                      Center(
                                                        child: FittedBox(
                                                          fit: BoxFit.scaleDown,
                                                          child: Text(
                                                            waktuText,
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Center(
                                                        child: FittedBox(
                                                          fit: BoxFit.scaleDown,
                                                          child: Text(
                                                            "${jadwal_idx.mata_kuliah}",
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Center(
                                                        child:
                                                        getPesanButtons(jadwal_idx.mata_kuliah, jamMulai, jamSelesai)[index],
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
            ),
          );
        } else {
          return const Text("No data");
        }
      },
    ));
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
      String namaJadwal, String jam_mulai, String jam_selesai) {
    List<Widget> buttons = [];
    String buttonStatus;

    for (int i = 0; i < 15; i++) {
      if (namaJadwal == "kosong") {
        buttonStatus = "1";
      } else {
        buttonStatus = "0";
      }
      switch (buttonStatus) {
        case "0":
          buttons.add(
            const ButtonDipakai(),
          );
          break;
        case "1":
          buttons.add(
            ButtonReservasi(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('nama_lab', nama_lab.toString());
                String tanggal_mulai = _selectedDate != null
                    ? DateFormat('dd-MM-yyyy').format(_selectedDate!)
                    : DateFormat('dd-MM-yyyy').format(today);
                await prefs.setString('tanggal_mulai', tanggal_mulai);
                await prefs.setString('jam_mulai', jam_mulai);
                await prefs.setString('jam_selesai', jam_selesai);

                Navigator.pushReplacementNamed(context, Keperluan.nameRoute);
              },
            ),
          );
          break;
        case "2":
          buttons.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ButtonDipesan(),
                const SizedBox(width: 5),
                ButtonBatalkan(
                  onPressed: () {},
                ),
              ],
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
