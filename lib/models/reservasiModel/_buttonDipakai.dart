import 'package:flutter/material.dart';

class ButtonDipakai extends StatefulWidget {
  const ButtonDipakai({
    Key? key,
  }) : super(key: key);

  @override
  _ButtonDipakaiState createState() => _ButtonDipakaiState();
}

class _ButtonDipakaiState extends State<ButtonDipakai> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: null,
      child: Text(
        "Dipakai",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
