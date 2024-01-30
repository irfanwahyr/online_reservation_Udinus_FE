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
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust font size based on screen width
    double fontSize = screenWidth > 400 ? 24.0 : 18.0;
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize, // Sesuaikan dengan ukuran font yang diinginkan
        fontWeight: FontWeight.w500,
        color: color,
      ),
      textAlign: TextAlign.left,
      
    );
  }
}
