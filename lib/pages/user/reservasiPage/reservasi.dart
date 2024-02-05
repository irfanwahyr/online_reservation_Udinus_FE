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
  import 'package:shared_preferences/shared_preferences.dart';

  class Reservasi extends StatefulWidget {
    static const nameRoute = "/Reservasi";

    const Reservasi({Key? key}) : super(key: key);

    @override
    State<Reservasi> createState() => _ReservasiState();
  }

  class _ReservasiState extends State<Reservasi> {
    DateTime today = DateTime.now();
    bool showJadwal = false;
    ListReservasi listReservasi = ListReservasi();
    String? dataLab;

    @override
    void initState() {
      super.initState();
      getData();
    }

    void getData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? dataLab = prefs.getString('data');

      setState(() {
        this.dataLab = dataLab;
      });
    }

    void _onDaySelected(DateTime day, DateTime focusedDay) {
      setState(() {
        today = day;
        showJadwal = true;
      });
    }

    void navigateToKeperluan(BuildContext context) {
      Navigator.pushNamed(context, Keperluan.nameRoute);
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
          today = pickedDate;
          showJadwal = true;
        });
      }
    }

    List<Widget> getPesanButtons() {
      return [
        const ButtonDipakai(),
        const ButtonDipakai(),
        const ButtonDipakai(),
        ButtonReservasi(onPressed: () => navigateToKeperluan(context)),
        ButtonReservasi(onPressed: () => navigateToKeperluan(context)),
        const ButtonDipakai(),
        const ButtonDipakai(),
        const ButtonDipakai(),
        const ButtonDipakai(),
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
        ButtonDiproses(),
        ButtonDiproses(),
        ButtonReservasi(onPressed: () => navigateToKeperluan(context)),
      ];
    }

    @override
    Widget build(BuildContext context) {
      var Pesan = getPesanButtons();
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
                                "${today.day}-${today.month}-${today.year}",
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
                      "Anda memilih hari: ${listReservasi.getHari(today.weekday)}, ${today.day} ${listReservasi.getBulan(today.month)} ${today.year}",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8, // Set the desired width for the container
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.green[50],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            SizedBox(
                              width: _calculateSizedBoxWidth(context), // Set the desired width for the DataTable
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
                                rows: listReservasi.Waktu.map((waktu) {
                                  int index = listReservasi.Waktu.indexOf(waktu);
                                  return DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                        Center(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              waktu,
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
                                          child: Pesan[index],
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    }
  }
double _calculateSizedBoxWidth(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  // Set different widths based on screen size conditions
  if (screenWidth >= 900) {
    return screenWidth * 0.8; // Set to 75% of the screen width for larger screens
  } else {
    return screenWidth * 1.5; // Set to 90% of the screen width for smaller screens
  }
}