import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/models/reservasiModel/_buttonBatalkan.dart';
import 'package:kp2024/models/reservasiModel/_buttonDipakai.dart';
import 'package:kp2024/models/reservasiModel/_buttonDipesan.dart';
import 'package:kp2024/models/reservasiModel/_buttonReservasi.dart';

class Reservasi extends StatefulWidget {
  const Reservasi({super.key});

  @override
  State<Reservasi> createState() => _ReservasiState();
}

class _ReservasiState extends State<Reservasi> {
  DateTime today = DateTime.now();
  bool showJadwal = false;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      showJadwal = true;
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
        today = pickedDate;
        showJadwal = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Heading2(
                    text: "Reservasi Ruangan Laboratorium A",
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
                      icon: Icon(Icons.calendar_today),
                      label: const Text(
                        "Pilih Tanggal",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(200, 80), // Set lebar dan tinggi button
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
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                  
                ),
                const SizedBox(height: 20),
                // Container baru untuk menampilkan pesan
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(213, 6, 6, 146),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Anda memilih hari ${getHari(today.weekday)} tanggal ${today.day} bulan ${getBulan(today.month)} tahun ${today.year}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
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
                            borderRadius: BorderRadius.only(
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
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                    ),
                                  ),
                                ),
                                
                              ),
                            ],
                            
                            // Gunakan map untuk membuat DataRow secara otomatis dari listWaktu
                            rows: listWaktu.map((waktu) {
                              int index = listWaktu.indexOf(waktu);
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
                                        listKeterangan[
                                            index], // Ganti dengan nilai dari listKeterangan
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Pesan[
                                          index], // Ganti dengan widget dari list Pesan
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

  // Fungsi untuk mendapatkan nama hari
  String getHari(int day) {
    switch (day) {
      case 1:
        return "Senin";
      case 2:
        return "Selasa";
      case 3:
        return "Rabu";
      case 4:
        return "Kamis";
      case 5:
        return "Jumat";
      case 6:
        return "Sabtu";
      case 7:
        return "Minggu";
      default:
        return "";
    }
  }

  // Fungsi untuk mendapatkan nama bulan
  String getBulan(int month) {
    switch (month) {
      case 1:
        return "Januari";
      case 2:
        return "Februari";
      case 3:
        return "Maret";
      case 4:
        return "April";
      case 5:
        return "Mei";
      case 6:
        return "Juni";
      case 7:
        return "Juli";
      case 8:
        return "Agustus";
      case 9:
        return "September";
      case 10:
        return "Oktober";
      case 11:
        return "November";
      case 12:
        return "Desember";
      default:
        return "";
    }
  }

  List<String> listWaktu = [
    "07.00 - 07.40",
    "07.40 - 08.40",
    "08.40 - 09.30",
    "10.20 - 11.10",
    "11.10 - 12.00",
    "12.30 - 13.20",
    "13.20 - 14.10",
    "14.10 - 15.00",
    "15.30 - 16.20",
    "16.20 - 17.10",
    "17.10 - 18.00",
    "18.30 - 19.20",
    "19.20 - 20.10",
    "20.10 - 21.00",
  ];

  List<String> listKeterangan = [
    "Pemrograman Perangkat Bergerak",
    "Pemrograman Perangkat Bergerak",
    "Pemrograman Perangkat Bergerak",
    " ",
    " ",
    "Desain Grafis",
    "Desain Grafis",
    "Pengolahan Citra Digital",
    "Pengolahan Citra Digital",
    "Workshop BK",
    "Workshop BK",
    " ",
    " ",
    " ",
  ];

  List<Widget> Pesan = [
    const ButtonDipakai(),
    const ButtonDipakai(),
    const ButtonDipakai(),
    ButtonReservasi(onPressed: () {}),
    ButtonReservasi(onPressed: () {}),
    const ButtonDipakai(),
    const ButtonDipakai(),
    const ButtonDipakai(),
    const ButtonDipakai(),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonDipesan(),
        SizedBox(width: 5),
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
    ButtonReservasi(onPressed: () {}),
    ButtonReservasi(onPressed: () {}),
    ButtonReservasi(onPressed: () {}),
  ];
}
