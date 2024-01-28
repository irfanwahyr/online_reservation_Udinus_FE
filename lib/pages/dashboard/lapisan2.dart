import 'package:flutter/material.dart';
import 'package:kp2024/models/_carousel.dart';

class Lapisan2 {
  Container buildContainer() {
    return Container(
      height: 500, // Sesuaikan tinggi sesuai kebutuhan
      decoration: const BoxDecoration(color: Color.fromARGB(190, 129, 129, 129)),
      child: const MyCarousel(),
    );
  }
}
