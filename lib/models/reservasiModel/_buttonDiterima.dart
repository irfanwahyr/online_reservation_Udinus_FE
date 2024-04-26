import 'package:flutter/material.dart';

class ButtonDiterima extends StatefulWidget {

  const ButtonDiterima({Key? key}) : super(key: key);

  @override
  _ButtonDiterimaState createState() => _ButtonDiterimaState();
}

class _ButtonDiterimaState extends State<ButtonDiterima> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 0, 205, 65),
      ),
      child: const Text(
        "Diterima",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
