import 'package:flutter/material.dart';
import 'package:kp2024/models/_appBarBack.dart';
import 'package:kp2024/models/_buttonPrimary.dart';
import 'package:kp2024/models/reservasiModel/_fieldContainer.dart';
import 'package:kp2024/models/reservasiModel/_fieldJam.dart';
import 'package:kp2024/models/reservasiModel/_fieldKeterangan.dart';
import 'package:kp2024/models/reservasiModel/_fieldTanggal.dart';
import 'package:kp2024/models/reservasiModel/_textFieldReservasi.dart';
import 'package:kp2024/models/reservasiModel/_uploadPDFButton.dart';
import 'package:kp2024/pages/user/reservasiPage/berhasilSubmit.dart';
import 'package:kp2024/pages/user/reservasiPage/keperluan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AcaraKampus extends StatefulWidget {
  static const nameRoute = 'AcaraKampus';
  const AcaraKampus({
    super.key,
  });

  @override
  State<AcaraKampus> createState() => _AcaraKampusState();
}

class _AcaraKampusState extends State<AcaraKampus> {
  String? nama_lab;
  String? tanggal_mulai;
  // String? tanggal_selesai;
  String? jam_mulai;
  String? jam_selesai;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nama_lab = prefs.getString('nama_lab');
    String? tanggal_mulai = prefs.getString('tanggal_mulai');
    // String? tanggal_selesai = prefs.getString('tanggal_selesai');
    String? jam_mulai = prefs.getString('jam_mulai');
    String? jam_selesai = prefs.getString('jam_selesai');

    setState(() {
      this.nama_lab = nama_lab;
      this.tanggal_mulai = tanggal_mulai;
      // this.tanggal_selesai = tanggal_selesai;
      this.jam_mulai = jam_mulai;
      this.jam_selesai = jam_selesai;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(onPressed: (){Navigator.pushReplacementNamed(context, Keperluan.nameRoute);}).buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        // child: SingleChildScrollView(
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         const Center(
        //           child: Text(
        //             'Acara Kampus',
        //             textAlign: TextAlign.center,
        //             style: TextStyle(
        //               fontFamily: 'Archivo',
        //               fontSize: 40,
        //               color: Colors.black,
        //             ),
        //           ),
        //         ),
        //         const SizedBox(height: 30),
        //         LayoutBuilder(
        //           builder: (context, constraints) {
        //             if (constraints.maxWidth > 900) {
        //               // Jika lebar layar lebih besar dari 700, tampilkan sebagai row
        //               return Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: buildAcaraKampus(context),
        //               );
        //             } else {
        //               // Jika lebar layar kurang dari atau sama dengan 700, tampilkan sebagai column
        //               return Column(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: buildAcaraKampus(context),
        //               );
        //             }
        //           },
        //         ),
        //         const SizedBox(height: 30),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }

  List<Widget> buildAcaraKampus(BuildContext context) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFieldReservasi(
            
            judul: "Fakultas",
            hintText: "Masukkan Nama Fakultas",
            keyboardType: TextInputType.name,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          TextFieldReservasi(
            judul: "Penanggung Jawab",
            hintText: "Masukkan Nama Lengkap PJ Acara",
            keyboardType: TextInputType.text,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          TextFieldReservasi(
            judul: "Kontak Whatsapp",
            hintText: "Masukkan No WA Penanggung Jawab",
            keyboardType: TextInputType.text,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          TextFieldReservasi(
            judul: "Nama Acara",
            hintText: "Masukkan Nama Acara",
            keyboardType: TextInputType.text,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          FieldContainer(
              judul: "Ruangan Dipilih", dataDikirim: nama_lab.toString()),
          const SizedBox(height: 10),
          FieldTanggal(
              judul: "Masukkan Tanggal", tanggal_Mulai: tanggal_mulai.toString()),
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
            jam_mulai: jam_mulai.toString(),
            jam_selesai: jam_selesai.toString(),
          ),
          const SizedBox(height: 15),
          const FieldKeterangan(
              judul: "Keterangan Tambahan", keyboardType: TextInputType.text),
          const SizedBox(height: 10),
          const UploadPDFButton(judul: "Upload Proposal Acara"),
          const SizedBox(height: 10),
          const UploadPDFButton(judul: "Upload Surat Peminjaman"),
          const SizedBox(height: 10),
          SizedBox(
            height: 70,
            width: 400,
            child: Center(
              child: HoverButtonPrimary(
                  text: "Submit",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, BerhasilSubmit.nameRoute);
                  }),
            ),
          ),
        ],
      ),
    ];
  }
}
