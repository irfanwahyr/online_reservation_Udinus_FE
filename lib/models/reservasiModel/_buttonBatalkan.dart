import 'package:flutter/material.dart';

class ButtonBatalkan extends StatefulWidget {
  final VoidCallback? onPressed;
  const ButtonBatalkan({Key? key, required this.onPressed}) : super(key: key);

  @override
  _ButtonBatalkanState createState() => _ButtonBatalkanState();
}

class _ButtonBatalkanState extends State<ButtonBatalkan> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 217, 36, 0),
      ),
      child: Text(
        "Batalkan",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
