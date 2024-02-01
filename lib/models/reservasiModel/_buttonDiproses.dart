import 'package:flutter/material.dart';

class ButtonDiproses extends StatefulWidget {
  final VoidCallback? onPressed;
  const ButtonDiproses({Key? key, required this.onPressed}) : super(key: key);

  @override
  _ButtonDiprosesState createState() => _ButtonDiprosesState();
}

class _ButtonDiprosesState extends State<ButtonDiproses> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 0, 127, 217),
      ),
      child: const Text(
        "Batalkan",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
