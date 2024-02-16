import 'package:flutter/material.dart';

class ButtonSelesai extends StatefulWidget {
  const ButtonSelesai({Key? key}) : super(key: key);

  @override
  _ButtonSelesaiState createState() => _ButtonSelesaiState();
}

class _ButtonSelesaiState extends State<ButtonSelesai> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 131, 189, 230),
      ),
      child: const Text(
        "Selesai",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
