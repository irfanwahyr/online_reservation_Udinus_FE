import 'package:flutter/material.dart';

class ButtonSecondary extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const ButtonSecondary({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ButtonSecondaryState createState() => _ButtonSecondaryState();
}

class _ButtonSecondaryState extends State<ButtonSecondary> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onHover(true),
      onExit: (event) => onHover(false),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isHovered
              ? Colors.grey.shade300
              : const Color.fromARGB(255, 19, 152, 235),
          minimumSize: const Size(100, 50), // Sesuaikan dengan ukuran yang diinginkan
        ),
        child: Text(
          widget.text,
          style: TextStyle(
              color: isHovered ? const Color.fromARGB(255, 1, 24, 50) : Colors.white,
              fontSize: 18),
        ),
      ),
    );
  }

  void onHover(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
