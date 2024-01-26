import 'package:flutter/material.dart';

class HoverButtonPrimary extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const HoverButtonPrimary({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  _HoverButtonPrimaryState createState() => _HoverButtonPrimaryState();
}

class _HoverButtonPrimaryState extends State<HoverButtonPrimary> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onHover(true),
      onExit: (event) => onHover(false),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
              color: isHovered ? Color.fromARGB(255, 1, 24, 50) : Colors.white,
              fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isHovered
              ? Colors.grey.shade300
              : const Color.fromARGB(255, 255, 168, 7),
          minimumSize: Size(100, 50), // Sesuaikan dengan ukuran yang diinginkan
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
