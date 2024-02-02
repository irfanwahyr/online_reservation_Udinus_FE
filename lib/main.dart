import 'package:flutter/material.dart';
import 'package:kp2024/pages/detailLab/detailA.dart';
import 'package:kp2024/pages/detailLab/detailB.dart';
import 'package:kp2024/pages/detailLab/detailC.dart';
import 'package:kp2024/pages/detailLab/detailD.dart';
import 'package:kp2024/pages/detailLab/detailE.dart';
import 'package:kp2024/pages/detailLab/detailG.dart';
import 'package:kp2024/pages/detailLab/detailH.dart';
import 'package:kp2024/pages/detailLab/detailI.dart';
import 'package:kp2024/pages/detailLab/detailJ.dart';
import 'package:kp2024/pages/detailLab/detailK.dart';
import 'package:kp2024/pages/detailLab/detailL.dart';
import 'package:kp2024/pages/detailLab/detailM.dart';
import 'package:kp2024/pages/detailLab/detailN.dart';
import 'package:kp2024/pages/homePage.dart';
import 'package:kp2024/pages/laboratorium/labDekstop.dart';
import 'package:kp2024/pages/laboratorium/labMultimedia.dart';
import 'package:kp2024/pages/laboratorium/labProgramming.dart';
import 'package:kp2024/pages/laboratorium/labStatistik.dart';
import 'package:kp2024/pages/logSign.dart';
import 'package:kp2024/pages/user/formKeperluan/acaraKampus.dart';
import 'package:kp2024/pages/user/formKeperluan/acaraOrganisasi.dart';
import 'package:kp2024/pages/user/formKeperluan/kuliahPengganti.dart';
import 'package:kp2024/pages/user/reservasiPage/keperluan.dart';

void main(List<String> args) {
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
      routes: {
        HomePage.nameRoute: (context) => HomePage(),
        LogSign.nameRoute: (context) => LogSign(),
        LabDekstop.nameRoute: (context) => LabDekstop(),
        LabMultimedia.nameRoute: (context) => LabMultimedia(),
        LabProgramming.nameRoute: (context) => LabProgramming(),
        LabStatistik.nameRoute: (context) => LabStatistik(),
        DetailA.nameRoute: (context) => DetailA(),
        DetailB.nameRoute: (context) => DetailB(),
        DetailC.nameRoute: (context) => DetailC(),
        DetailD.nameRoute: (context) => DetailD(),
        DetailE.nameRoute: (context) => DetailE(),
        DetailG.nameRoute: (context) => DetailG(),
        DetailH.nameRoute: (context) => DetailH(),
        DetailI.nameRoute: (context) => DetailI(),
        DetailJ.nameRoute: (context) => DetailJ(),
        DetailK.nameRoute: (context) => DetailK(),
        DetailL.nameRoute: (context) => DetailL(),
        DetailM.nameRoute: (context) => DetailM(),
        DetailN.nameRoute: (context) => DetailN(),
        Keperluan.nameRoute: (context) => Keperluan(),
        AcaraKampus.nameRoute: (context) => AcaraKampus(),
        AcaraOrganisasi.nameRoute: (context) => AcaraOrganisasi(),
        KuliahPengganti.nameRoute: (context) => KuliahPengganti(),
      },
    );
  }
}
