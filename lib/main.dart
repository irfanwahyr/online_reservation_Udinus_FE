import 'package:flutter/material.dart';
import 'package:kp2024/pages/admin/daftarLaboratorium.dart';
import 'package:kp2024/pages/admin/daftarMataKuliah.dart';
import 'package:kp2024/pages/admin/daftarPengguna.dart';
import 'package:kp2024/pages/admin/homePageAdmin.dart';
import 'package:kp2024/pages/admin/kontenDaftarMataKuliah/jadwalHari.dart';
import 'package:kp2024/pages/detailLab/DetailLaboratorium.dart';
import 'package:kp2024/pages/homePage.dart';
import 'package:kp2024/pages/laboratorium/labDekstop.dart';
import 'package:kp2024/pages/laboratorium/labMultimedia.dart';
import 'package:kp2024/pages/laboratorium/labProgramming.dart';
import 'package:kp2024/pages/laboratorium/labStatistik.dart';
import 'package:kp2024/pages/logSign.dart';
import 'package:kp2024/pages/user/formKeperluan/acaraKampus.dart';
import 'package:kp2024/pages/user/formKeperluan/acaraOrganisasi.dart';
import 'package:kp2024/pages/user/formKeperluan/kuliahPengganti.dart';
import 'package:kp2024/pages/user/reservasiPage/berhasilSubmit.dart';
import 'package:kp2024/pages/user/reservasiPage/keperluan.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';
import 'package:kp2024/pages/user/reservasiPage/riwayatReservasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main(List<String> args) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: HomePage.nameRoute,
      // home: HomePageAdmin(),
      // initialRoute: HomePageAdmin.nameRoute,
      routes: {
        HomePage.nameRoute: (context) => HomePage(),
        LogSign.nameRoute: (context) => LogSign(),
        LabDekstop.nameRoute: (context) => LabDekstop(),
        LabMultimedia.nameRoute: (context) => LabMultimedia(),
        LabProgramming.nameRoute: (context) => LabProgramming(),
        LabStatistik.nameRoute: (context) => LabStatistik(),
        Keperluan.nameRoute: (context) => Keperluan(),
        AcaraKampus.nameRoute: (context) => AcaraKampus(),
        AcaraOrganisasi.nameRoute: (context) => AcaraOrganisasi(),
        KuliahPengganti.nameRoute: (context) => KuliahPengganti(),
        BerhasilSubmit.nameRoute: (context) => BerhasilSubmit(),
        Reservasi.nameRoute: (context) => Reservasi(),
        DetailLaboratorium.nameRoute: (context) => DetailLaboratorium(),
        HomePageAdmin.nameRoute: (context) => HomePageAdmin(),
        DaftarPengguna.nameRoute: (context) => DaftarPengguna(),
        DaftarMataKuliah.nameRoute: (context) => DaftarMataKuliah(),
        DaftarLaboratorium.nameRoute: (context) => DaftarLaboratorium(),
        JadwalHari.nameRoute: (context) => JadwalHari(),
        RiwayatReservasi.nameRoute: (context) => RiwayatReservasi(),
      },
      // onGenerateRoute: ,
    );
  }
}
