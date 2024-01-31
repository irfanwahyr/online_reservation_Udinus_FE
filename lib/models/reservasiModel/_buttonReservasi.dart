import 'package:flutter/material.dart';

class ButtonReservasi extends StatefulWidget {
  final VoidCallback? onPressed;
  const ButtonReservasi({Key? key, required this.onPressed}) : super(key: key);

  @override
  _ButtonReservasiState createState() => _ButtonReservasiState();
}

class _ButtonReservasiState extends State<ButtonReservasi> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 255, 168, 7),
      ),
      child: Text(
        "Reservasi",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
