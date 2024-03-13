import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/admin/_cardHari.dart';
import 'package:kp2024/pages/admin/kontenDaftarMataKuliah/jadwalHari.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KontenDaftarMataKuliah extends StatefulWidget {
  final String nama_lab;
  const KontenDaftarMataKuliah({Key? key, required this.nama_lab}) : super(key: key);

  @override
  State<KontenDaftarMataKuliah> createState() => _KontenDaftarMataKuliahState();
}

class _KontenDaftarMataKuliahState extends State<KontenDaftarMataKuliah> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Heading1(
              text: "Jadwal Matkul Lab ${widget.nama_lab}", color: Colors.black),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return _buildLargeScreenLayout();
              }
              else if (constraints.maxWidth < 400) {
                return _buildVerySmallScreenLayout();
              } 
              
              else {
                return _buildSmallScreenLayout();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildVerySmallScreenLayout() {
  final List<Widget> dayCards = _buildDayCards();

  return Wrap(
    alignment: WrapAlignment.spaceEvenly,
    direction: Axis.horizontal,
    children: dayCards.map((card) {
      return Container(
        margin: EdgeInsets.all(4),
        height: 150, // Sesuaikan margin sesuai kebutuhan
        width: 150, // Sesuaikan lebar card sesuai kebutuhan
        child: card,
      );
    }).toList(),
  );
}

  Widget _buildSmallScreenLayout() {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      direction: Axis.horizontal,
      children: [
        ..._buildDayCards(),
      ],
    );
  }

  Widget _buildLargeScreenLayout() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildDayCards().sublist(0, 3),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildDayCards().sublist(3),
        ),
      ],
    );
  }

  List<Widget> _buildDayCards() {
    final List<String> days = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"];

    return days.map((day) {
      return CardHari(
        imagePath: "images/gambar.jpg",
        text: day,
        onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('nama_lab', "${widget.nama_lab}");
          await prefs.setString('hari', day);
          // Mendapatkan indeks dari elemen yang dipilih
          int index = days.indexOf(day);
          await prefs.setInt('id_hari', index+1);
          Navigator.pushReplacementNamed(
            context,
            JadwalHari.nameRoute,
          );
        },
      );
    }).toList();
  }
}
