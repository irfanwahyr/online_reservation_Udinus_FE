import 'package:flutter/material.dart';

class Heading7 extends StatelessWidget {
  final String text;
  final Color color;

  const Heading7({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust font size based on screen width
    double fontSize = screenWidth > 450
        ? 30.0
        : screenWidth > 500
            ? 25
              : screenWidth > 350
                ? 20
                : 15;
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize, // Sesuaikan dengan ukuran font yang diinginkan
        fontWeight: FontWeight.w700,
        fontFamily: "Archivo",
        color: color,
      ),
      textAlign: TextAlign.left,
    );
  }
}
