import 'package:flutter/material.dart';

class Heading2 extends StatelessWidget {
  final String text;
  final Color color;

  const Heading2({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24, // Sesuaikan dengan ukuran font yang diinginkan
        fontWeight: FontWeight.w500,
        color: color,
      ),
      textAlign: TextAlign.left,
      
    );
  }
}
