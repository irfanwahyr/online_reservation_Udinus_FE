import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/admin/_cardHari.dart';
import 'package:kp2024/pages/admin/kontenDaftarMataKuliah/jadwalHari.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KontenDaftarMataKuliah extends StatefulWidget {
  final String namaLab;
  const KontenDaftarMataKuliah({Key? key, required this.namaLab})
      : super(key: key);

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
              text: "Jadwal Matkul Lab ${widget.namaLab}", color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardHari(
                imagePath: "images/gambar.jpg",
                text: "Senin",
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('namaLabAdmin', "${widget.namaLab}");
                  await prefs.setString('hariAdmin', "Senin");

                  Navigator.pushNamed(
                    context,
                    JadwalHari.nameRoute,
                  );
                },
              ),
              CardHari(
                imagePath: "images/gambar.jpg",
                text: "Selasa",
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('namaLabAdmin', "${widget.namaLab}");
                  await prefs.setString('hariAdmin', "Selasa");
                  Navigator.pushNamed(
                    context,
                    JadwalHari.nameRoute,
                  );
                },
              ),
              CardHari(
                imagePath: "images/gambar.jpg",
                text: "Rabu",
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('namaLabAdmin', "${widget.namaLab}");
                  await prefs.setString('hariAdmin', "Rabu");
                  Navigator.pushNamed(
                    context,
                    JadwalHari.nameRoute,
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardHari(
                imagePath: "images/gambar.jpg",
                text: "Kamis",
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('namaLabAdmin', "${widget.namaLab}");
                  await prefs.setString('hariAdmin', "Kamis");
                  Navigator.pushNamed(
                    context,
                    JadwalHari.nameRoute,
                  );
                },
              ),
              CardHari(
                imagePath: "images/gambar.jpg",
                text: "Jumat",
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('namaLabAdmin', "${widget.namaLab}");
                  await prefs.setString('hariAdmin', "Jumat");
                  Navigator.pushNamed(
                    context,
                    JadwalHari.nameRoute,
                  );
                },
              ),
              CardHari(
                imagePath: "images/gambar.jpg",
                text: "Sabtu",
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('namaLabAdmin', "${widget.namaLab}");
                  await prefs.setString('hariAdmin', "Sabtu");
                  Navigator.pushNamed(
                    context,
                    JadwalHari.nameRoute,
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
