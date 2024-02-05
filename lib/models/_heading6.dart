import 'package:flutter/material.dart';

class Heading6 extends StatelessWidget {
  final String text;
  final Color color;

  const Heading6({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust font size based on screen width
    double fontSize = screenWidth > 1200
        ? 30.0
        : screenWidth > 500
            ? 22.5
            : 18.0;

    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontFamily: "Archivo",
        color: color,
      ),
    );
  }
}
