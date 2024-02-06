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
import 'package:shared_preferences/shared_preferences.dart';

class AcaraOrganisasi extends StatefulWidget {
  static const nameRoute = 'AcaraOrganisasi';
  const AcaraOrganisasi({
    super.key,
  });

  @override
  State<AcaraOrganisasi> createState() => _AcaraOrganisasiState();
}

class _AcaraOrganisasiState extends State<AcaraOrganisasi> {
  String? dataNamaLab;
  String? dataTanggal;
  String? dataJam;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataNamaLab = prefs.getString('dataNamaLab');
    String? dataTanggal = prefs.getString('dataTanggal');
    String? dataJam = prefs.getString('dataJam');

    setState(() {
      this.dataNamaLab = dataNamaLab;
      this.dataTanggal = dataTanggal;
      this.dataJam = dataJam;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack().buildAppBar(context),
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
            judul: "Nama Organisasi",
            hintText: "Masukkan Nama Ormawa",
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
              judul: "Ruangan Dipilih",
              dataDikirim: dataNamaLab
                  .toString()), //dataDikirim di ganti dari database wer
          const SizedBox(height: 10),
          FieldTanggal(
              judul: "Masukkan Tanggal", tanggalMulai: dataTanggal.toString())
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
            mulai: "07.00",
            selesai: "07.40",
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
                    Navigator.pushNamed(context, BerhasilSubmit.nameRoute);
                  }),
            ),
          ),
        ],
      ),
    ];
  }
}
