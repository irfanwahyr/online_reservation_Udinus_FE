import 'package:flutter/material.dart';
import 'package:kp2024/controllers/user_form/kelas_pengganti.dart';
import 'package:kp2024/models/_appBarBack.dart';
import 'package:kp2024/models/_buttonPrimary.dart';
import 'package:kp2024/models/reservasiModel/_fieldContainer.dart';
import 'package:kp2024/models/reservasiModel/_fieldJam.dart';
import 'package:kp2024/models/reservasiModel/_fieldKeterangan.dart';
import 'package:kp2024/models/reservasiModel/_textFieldReservasi.dart';
import 'package:kp2024/pages/user/reservasiPage/berhasilSubmit.dart';
import 'package:kp2024/pages/user/reservasiPage/keperluan.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KuliahPengganti extends StatefulWidget {
  static const nameRoute = 'KuliahPengganti';
  const KuliahPengganti({super.key});

  @override
  State<KuliahPengganti> createState() => _KuliahPenggantiState();
}

class _KuliahPenggantiState extends State<KuliahPengganti> {
  String? nama_lab;
  String? tanggal_mulai;
  String? jam_mulai;
  String? jam_selesai;
  int? id_user;
  int? id_pesan;
  int? id_hari;
  int? id_matkul;
  String? token;
  String? default_mata_kuliah;
  String? default_kelompok;
  String? default_jam_mulai;
  String? default_jam_selesai;
  bool isBooked = false;

  final TextEditingController nama_dosen = TextEditingController();
  final TextEditingController mata_kuliah = TextEditingController();
  final TextEditingController kelompok = TextEditingController();
  final TextEditingController no_whatsapp = TextEditingController();
  final TextEditingController keterangan = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nama_lab = prefs.getString('nama_lab');
    int? id_user = prefs.getInt('id_user');
    int? id_pesan = prefs.getInt('id_pesan');
    int? id_hari = prefs.getInt('id_hari');
    int? id_matkul = prefs.getInt('id_matkul');
    String? tanggal_mulai = prefs.getString('tanggal_mulai');
    String? jam_mulai = prefs.getString('jam_mulai');
    String? jam_selesai = prefs.getString('jam_selesai');
    String? token = prefs.getString('token');
    String? default_mata_kuliah = prefs.getString('default_mata_kuliah');
    String? default_kelompok = prefs.getString('default_kelompok');
    String? default_jam_mulai = prefs.getString('jam_mulai');
    String? default_jam_selesai = prefs.getString('jam_selesai');
    bool isBooked = prefs.getBool('booked') ?? false;

    setState(() {
      this.nama_lab = nama_lab;
      this.id_user = id_user;
      this.id_pesan = id_pesan;
      this.id_hari = id_hari;
      this.id_matkul = id_matkul;
      this.tanggal_mulai = tanggal_mulai;
      this.jam_mulai = jam_mulai;
      this.jam_selesai = jam_selesai;
      this.token = token;
      this.default_mata_kuliah = default_mata_kuliah;
      this.default_kelompok = default_kelompok;
      this.default_jam_mulai = default_jam_mulai;
      this.default_jam_selesai = default_jam_selesai;
      this.isBooked = isBooked;
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
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: buildKuliahPengganti(context),
                      );
                    } else {
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
            controller: nama_dosen,
            judul: "Nama Dosen",
            hintText: "Masukkan Nama Lengkap",
            keyboardType: TextInputType.name,
            onSubmitted: (value) {},
          ),
          TextFieldReservasi(
            controller: mata_kuliah,
            judul: "Mata Kuliah",
            hintText: "Masukkan Nama Matkul",
            keyboardType: TextInputType.text,
            onSubmitted: (value) {},
          ),
          TextFieldReservasi(
            controller: kelompok,
            judul: "Kelompok",
            hintText: "Masukkan Kelompok",
            keyboardType: TextInputType.text,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          TextFieldReservasi(
            controller: no_whatsapp,
            judul: "Kontak Whatsapp",
            hintText: "Masukkan Nomor Aktif",
            keyboardType: TextInputType.text,
            onSubmitted: (value) {
              //fungsi disini wer
            },
          ),
          FieldContainer(
              judul: "Ruangan Dipilih", dataDikirim: nama_lab.toString()),
          const SizedBox(height: 10),
          FieldContainer(
            judul: "Tanggal Dipilih",
            dataDikirim: tanggal_mulai.toString(),
          ),
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
            onJamSelesaiSelected: (String val){
                setState(() {
                  jam_selesai = val;
                });
            },
          ),
          const SizedBox(height: 15),
          FieldKeterangan(
              controller: keterangan,
              judul: "Keterangan Tambahan",
              keyboardType: TextInputType.text),
          const SizedBox(height: 15),
          SizedBox(
            height: 70,
            width: 400,
            child: Center(
              child: HoverButtonPrimary(
                text: "Submit",
                onPressed: isBooked
                  ? null
                  : () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      bool isBooked = prefs.getBool('booked') ?? false;
                      if (isBooked) {
                        return;
                      }
                      setState(() {
                        create(
                          nama_dosen.text,
                          mata_kuliah.text,
                          kelompok.text,
                          no_whatsapp.text,
                          nama_lab ?? "",
                          tanggal_mulai ?? "",
                          jam_mulai ?? "",
                          jam_selesai ?? "",
                          keterangan.text,
                          id_user ?? 0,
                          token ?? "",
                          id_hari ?? 0,
                          id_matkul ?? 0,
                          default_mata_kuliah ?? "",
                          default_kelompok ?? "",
                          default_jam_mulai ?? "",
                          default_jam_selesai ?? ""
                        );
                      });
                      Navigator.pushReplacementNamed(context, Reservasi.nameRoute);
                    },
              ),

            ),
          ),
        ],
      ),
    ];
  }
}
