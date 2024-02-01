import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/models/reservasiModel/_buttonBatalkan.dart';
import 'package:kp2024/models/reservasiModel/_buttonDipakai.dart';
import 'package:kp2024/models/reservasiModel/_buttonDipesan.dart';
import 'package:kp2024/models/reservasiModel/_buttonReservasi.dart';
import 'package:kp2024/pages/user/reservasiPage/keperluan.dart';
import 'package:kp2024/pages/user/reservasiPage/listReservasi.dart';

class Reservasi extends StatefulWidget {
  final String namaLab;
  const Reservasi({
    Key? key,
    required this.namaLab,
  }) : super(key: key);
  @override
  State<Reservasi> createState() => _ReservasiState();
}

class _ReservasiState extends State<Reservasi> {
  DateTime today = DateTime.now();
  bool showJadwal = false;
  ListReservasi listReservasi = ListReservasi();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      showJadwal = true;
    });
  }

  void navigateToKeperluan(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Keperluan()));
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
      ButtonReservasi(onPressed: () => navigateToKeperluan(context)),
      ButtonReservasi(onPressed: () => navigateToKeperluan(context)),
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
                  child: Heading2(
                    text: "Reservasi Ruangan Laboratorium ${widget.namaLab}",
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Heading1(
                  text: "JADWAL LABORATORIUM",
                  color: Colors.black,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _selectDate(context),
                      icon: const Icon(Icons.calendar_today),
                      label: const Text(
                        "Pilih Tanggal",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 80),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 180,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 168, 7),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          "${today.day}-${today.month}-${today.year}",
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
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
                    // "Anda memilih hari ${getHari(today.weekday)} tanggal ${today.day} bulan ${getBulan(today.month)} tahun ${today.year}",
                    "Anda memilih hari ${listReservasi.getHari(today.weekday)} tanggal ${today.day} bulan ${listReservasi.getBulan(today.month)} tahun ${today.year}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.green[50],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: Colors.green[50],
                          ),
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
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                    child: Text(
                                      "Keterangan",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                    child: Text(
                                      "Pesan",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
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
                                      child: Text(
                                        waktu,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        listReservasi.Keterangan[index],
                                        textAlign: TextAlign.center,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
