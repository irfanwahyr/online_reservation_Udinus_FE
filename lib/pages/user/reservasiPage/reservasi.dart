import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading5.dart';
import 'package:kp2024/models/_heading6.dart';
import 'package:kp2024/models/reservasiModel/_buttonBatalkan.dart';
import 'package:kp2024/models/reservasiModel/_buttonDipakai.dart';
import 'package:kp2024/models/reservasiModel/_buttonDipesan.dart';
import 'package:kp2024/models/reservasiModel/_buttonDiproses.dart';
import 'package:kp2024/models/reservasiModel/_buttonReservasi.dart';
import 'package:kp2024/pages/user/reservasiPage/keperluan.dart';
import 'package:kp2024/pages/user/reservasiPage/listReservasi.dart';
import 'package:intl/intl.dart';
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
  DateTime?
      _selectedDate; // tambahkan variabel untuk menyimpan tanggal yang dipilih
  ListReservasi listReservasi = ListReservasi();
  String? dataLab;
  String? dataTanggal;
  String? dataJam;
  List<String> Status = [
    "1",
    "0",
    "0",
    "0",
    "1",
    "2",
    "1",
    "1",
    "3",
    "0",
    "3",
    "1",
    "2",  
    "0",
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataLab = prefs.getString('dataNamaLab');

    setState(() {
      this.dataLab = dataLab;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime.utc(2024, 01, 01),
      lastDate: DateTime.utc(2040, 3, 14),
    );

    if (pickedDate != null && pickedDate != today) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
  List<Widget> getPesanButtons() {
    List<Widget> buttons = [];
    
    for (int i = 0; i < Status.length; i++) { 
      String status = Status[i];
      
      // Tentukan tindakan berdasarkan nilai status
      switch (status) {
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
                await prefs.setString('dataNamaLab', dataLab.toString());
                String dataTanggal = _selectedDate != null
                    ? DateFormat('dd-MM-yyyy').format(_selectedDate!)
                    : DateFormat('dd-MM-yyyy').format(today);
                await prefs.setString('dataTanggal', dataTanggal.toString());
                String dataJamMulai = listReservasi.Waktu_mulai[i].toString();
                String dataJamSelesai = listReservasi.Waktu_selesai[i].toString();
                await prefs.setString('dataJamMulai', dataJamMulai.toString());
                await prefs.setString('dataJamSelesai', dataJamSelesai.toString());


                Navigator.pushNamed(context, Keperluan.nameRoute);
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
          // Tindakan default jika diperlukan
          break;
      }
    }
    
    return buttons;
  }


  @override
  Widget build(BuildContext context) {
    var pesan = getPesanButtons();
    String pilihanTanggal =
        "Anda memilih hari: ${listReservasi.getHari(today.weekday)}, ${today.day} ${listReservasi.getBulan(today.month)} ${today.year}";
    // gunakan _selectedDate jika ada, jika tidak gunakan today
    String dataTanggal = _selectedDate != null
        ? DateFormat('dd-MM-yyyy').format(_selectedDate!)
        : DateFormat('dd-MM-yyyy').format(today);

    return Scaffold(
      body: Center(
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
                        "Reservasi Ruangan Laboratorium ${dataLab.toString()}",
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
                        double screenWidth = MediaQuery.of(context).size.width;
                        double buttonWidth = screenWidth > 900 ? 200.0 : 150.0;
                        double buttonHeight = screenWidth > 900 ? 80.0 : 60.0;
                        double fontSize = screenWidth > 900 ? 20.0 : 16.0;

                        return ElevatedButton.icon(
                          onPressed: () => _selectDate(context),
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
                        double screenWidth = MediaQuery.of(context).size.width;
                        double buttonWidth = screenWidth > 900 ? 200.0 : 150.0;
                        double buttonHeight = screenWidth > 900 ? 72.0 : 53.0;
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
                              dataTanggal,
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
                    pilihanTanggal,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Set the desired width for the container
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                                    context), // Set the desired width for the DataTable
                                child: DataTable(
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Expanded(
                                        child: Center(
                                          child: Text(
                                            "Waktu",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
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
                                              fontWeight: FontWeight.bold,
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
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: List.generate(listReservasi.Waktu_mulai.length, (index) {
                                    String waktuText = "${listReservasi.Waktu_mulai[index]} - ${listReservasi.Waktu_selesai[index]}";
                                    return DataRow(
                                      cells: <DataCell>[
                                        DataCell(
                                          Center(
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                waktuText,
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
                                                listReservasi.Keterangan[index],
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: pesan[index],
                                          ),
                                        ),
                                      ],
                                    );
                                  }),

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _calculateSizedBoxWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Set different widths based on screen size conditions
    if (screenWidth >= 900) {
      return screenWidth *
          0.8; // Set to 75% of the screen width for larger screens
    } else {
      return screenWidth *
          1.5; // Set to 90% of the screen width for smaller screens
    }
  }
}
