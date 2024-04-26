import 'package:flutter/material.dart';

class ButtonDitolak extends StatefulWidget {
  const ButtonDitolak({Key? key}) : super(key: key);

  @override
  _ButtonDitolakState createState() => _ButtonDitolakState();
}

class _ButtonDitolakState extends State<ButtonDitolak> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 205, 0, 0),
      ),
      child: const Text(
        "Ditolak",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
