import 'package:flutter/material.dart';

class ButtonDipesan extends StatefulWidget {
  const ButtonDipesan({
    Key? key,
  }) : super(key: key);

  @override
  _ButtonDipesanState createState() => _ButtonDipesanState();
}

class _ButtonDipesanState extends State<ButtonDipesan> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 7, 160, 51), // Warna teks button
      ),
      child: const Text(
        "Dipesan",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
