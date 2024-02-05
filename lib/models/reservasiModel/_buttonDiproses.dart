import 'package:flutter/material.dart';

class ButtonDiproses extends StatefulWidget {
  const ButtonDiproses({Key? key}) : super(key: key);

  @override
  _ButtonDiprosesState createState() => _ButtonDiprosesState();
}

class _ButtonDiprosesState extends State<ButtonDiproses> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 65, 174, 251),
      ),
      child: const Text(
        "Diproses",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
