import 'package:flutter/material.dart';
import 'package:kp2024/pages/homePage.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // debugShowCheckedModeBanner: false,
      // home: HomePage(),
      home: Reservasi(),
    );
  }
}
