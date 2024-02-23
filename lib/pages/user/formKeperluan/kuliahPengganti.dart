import 'package:flutter/material.dart';
import 'package:kp2024/models/_appBarBack.dart';
import 'package:kp2024/models/_buttonPrimary.dart';
import 'package:kp2024/models/reservasiModel/_fieldContainer.dart';
import 'package:kp2024/models/reservasiModel/_fieldJam.dart';
import 'package:kp2024/models/reservasiModel/_fieldKeterangan.dart';
import 'package:kp2024/models/reservasiModel/_textFieldReservasi.dart';
import 'package:kp2024/pages/user/reservasiPage/berhasilSubmit.dart';
import 'package:kp2024/pages/user/reservasiPage/keperluan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KuliahPengganti extends StatefulWidget {
  static const nameRoute = 'KuliahPengganti';
  const KuliahPengganti({super.key});

  @override
  State<KuliahPengganti> createState() => _KuliahPenggantiState();
}

class _KuliahPenggantiState extends State<KuliahPengganti> {
  String? dataNamaLab;
  String? dataTanggal;
  String? dataJamMulai;
  String? dataJamSelesai;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataNamaLab = prefs.getString('namaLab');
    String? dataTanggal = prefs.getString('dataTanggal');
    String? dataJamMulai = prefs.getString('dataJamMulai');
    String? dataJamSelesai = prefs.getString('dataJamSelesai');

    setState(() {
      this.dataNamaLab = dataNamaLab;
      this.dataTanggal = dataTanggal;
      this.dataJamMulai = dataJamMulai;
      this.dataJamSelesai = dataJamSelesai;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(onPressed: () {
        Navigator.pushReplacementNamed(context, Keperluan.nameRoute);
      }).buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Kuliah Pengganti',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Archivo',
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 900) {
                      // Jika lebar layar lebih besar dari 700, tampilkan sebagai row
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: buildKuliahPengganti(context),
                      );
                    } else {
                      // Jika lebar layar kurang dari atau sama dengan 700, tampilkan sebagai column
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: buildKuliahPengganti(context),
                      );
                    }
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildKuliahPengganti(BuildContext context) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFieldReservasi(
            judul: "Nama Dosen",
            hintText: "Masukkan Nama Lengkap",
            keyboardType: TextInputType.name,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          TextFieldReservasi(
            judul: "Mata Kuliah",
            hintText: "Masukkan Nama Matkul",
            keyboardType: TextInputType.text,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          TextFieldReservasi(
            judul: "Nama Kode Mata Kuliah",
            hintText: "Masukkan Kode Matkul",
            keyboardType: TextInputType.text,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          TextFieldReservasi(
            judul: "Kontak Whatsapp",
            hintText: "Masukkan Nomor Aktif",
            keyboardType: TextInputType.text,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          FieldContainer(
              judul: "Ruangan Dipilih", dataDikirim: dataNamaLab.toString()),
          const SizedBox(height: 10), //dataDikirim di ganti dari database wer
          FieldContainer(
            judul: "Tanggal Dipilih",
            dataDikirim: dataTanggal.toString(),
          ), //dataDikirim di ganti dari database wer
        ],
      ),
      const SizedBox(
        width: 20,
        height: 15,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FieldJam(
            judul: "Jam Dipilih",
            mulai: dataJamMulai.toString(),
            selesai: dataJamSelesai.toString(),
          ),
          const SizedBox(height: 15),
          const FieldKeterangan(
              judul: "Keterangan Tambahan", keyboardType: TextInputType.text),
          const SizedBox(height: 15),
          SizedBox(
            height: 70,
            width: 400,
            child: Center(
              child: HoverButtonPrimary(
                  text: "Submit",
                  onPressed: () {
                    Navigator.pushNamed(context, BerhasilSubmit.nameRoute);
                  }),
            ),
          ),
        ],
      ),
    ];
  }
}
