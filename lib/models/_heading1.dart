import 'package:flutter/material.dart';

class Heading1 extends StatelessWidget {
  final String text;
  final Color color;

  const Heading1({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 30, // Sesuaikan dengan ukuran font yang diinginkan
        fontWeight: FontWeight.w700,
        fontFamily: "Archivo",
        color: color,
      ),
      textAlign: TextAlign.left,
    );
  }
}
