import 'dart:io';

import 'package:file_picker/file_picker.dart';
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
import 'package:kp2024/controllers/user_form/acara_organisasi.dart';

class AcaraOrganisasi extends StatefulWidget {
  static const nameRoute = 'AcaraOrganisasi';
  const AcaraOrganisasi({
    super.key,
  });

  @override
  State<AcaraOrganisasi> createState() => _AcaraOrganisasiState();
}

class _AcaraOrganisasiState extends State<AcaraOrganisasi> {

  final TextEditingController nama_organisasi_controller = TextEditingController();
  final TextEditingController penanggung_jawab_controller = TextEditingController();
  final TextEditingController no_whatsapp_controller = TextEditingController();
  final TextEditingController nama_acara_controller = TextEditingController();
  final TextEditingController nama_lab_controller = TextEditingController();
  final TextEditingController tanggal_mulai_controller = TextEditingController();
  final TextEditingController tanggal_selesai_controller = TextEditingController();
  final TextEditingController jam_mulai_controller = TextEditingController();
  final TextEditingController jam_selesai_controller = TextEditingController();
  final TextEditingController keterangan_controller = TextEditingController();

  String? uploadedFileName;
  String? nama_lab;
  String? tanggal_mulai;
  DateTime? tanggal_selesai;
  String? jam_mulai;
  int? id_user;
  String? jam_selesai;
  String? token;
  PlatformFile? proposalFile;
  PlatformFile? suratPeminjamanFile;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nama_lab = prefs.getString('nama_lab');
    String? tanggal_mulai = prefs.getString('tanggal_mulai');
    String? jam_mulai = prefs.getString('jam_mulai');
    String? jam_selesai = prefs.getString('jam_selesai');
    String? token = prefs.getString('token');
    int? id_user = prefs.getInt('id_user');

    setState(() {
      this.nama_lab = nama_lab;
      this.tanggal_mulai = tanggal_mulai;
      this.jam_mulai = jam_mulai;
      this.jam_selesai = jam_selesai;
      this.id_user = id_user;
      this.token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(onPressed: (){Navigator.pushReplacementNamed(context, Keperluan.nameRoute);}).buildAppBar(context),
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
                    'Acara Organisasi',
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
                        children: buildAcaraOrganisasi(context),
                      );
                    } else {
                      // Jika lebar layar kurang dari atau sama dengan 700, tampilkan sebagai column
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: buildAcaraOrganisasi(context),
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

  List<Widget> buildAcaraOrganisasi(BuildContext context) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFieldReservasi(
            controller: nama_organisasi_controller,
            judul: "Nama Organisasi",
            hintText: "Masukkan Nama Ormawa",
            keyboardType: TextInputType.name,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          TextFieldReservasi(
            controller: penanggung_jawab_controller,
            judul: "Penanggung Jawab",
            hintText: "Masukkan Nama Lengkap PJ Acara",
            keyboardType: TextInputType.text,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          TextFieldReservasi(
            controller: no_whatsapp_controller,
            judul: "Kontak Whatsapp",
            hintText: "Masukkan No WA Penanggung Jawab",
            keyboardType: TextInputType.text,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          TextFieldReservasi(
            controller: nama_acara_controller,
            judul: "Nama Acara",
            hintText: "Masukkan Nama Acara",
            keyboardType: TextInputType.text,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          FieldContainer(
              judul: "Ruangan Dipilih",
              dataDikirim: nama_lab
                  .toString()), //dataDikirim di ganti dari database wer
          const SizedBox(height: 10),
          FieldTanggal(
            judul: "Masukkan Tanggal",
            tanggal_Mulai: tanggal_mulai.toString(),
            tanggal_Selesai: tanggal_selesai,
            onDateChanged: (date) {
              setState(() {
                tanggal_selesai = date;
              });
            },
          )
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
          UploadPDFButton(
            judul: "Upload Proposal Acara",
            onFileSelected: (file) {
              setState(() {
                proposalFile = file;
              });
            },
          ),
          const SizedBox(height: 10),
          UploadPDFButton(
            judul: "Upload Surat Peminjaman",
            onFileSelected: (file) {
              setState(() {
                suratPeminjamanFile = file;
              });
            },
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 70,
            width: 400,
            child: Center(
              child: HoverButtonPrimary(
                  text: "Submit",
                  onPressed: () {
                    setState(() {
                      create(
                        nama_organisasi_controller.text,
                        penanggung_jawab_controller.text,
                        no_whatsapp_controller.text,
                        nama_acara_controller.text,
                        nama_lab ?? "",
                        tanggal_mulai ?? "",
                        tanggal_selesai.toString(),
                        jam_mulai ?? "",
                        jam_selesai ?? "",
                        keterangan_controller.text,
                        id_user ?? 0,
                        proposalFile!,
                        suratPeminjamanFile!,
                        token ?? "");
                      
                    });
                    // Navigator.pushNamed(context, BerhasilSubmit.nameRoute);
                  }),
            ),
          ),
        ],
      ),
    ];
  }
}
