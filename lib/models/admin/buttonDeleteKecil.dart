import 'package:flutter/material.dart';

class ButtonDeletedKecil extends StatelessWidget {
  final VoidCallback? onTap;

  const ButtonDeletedKecil({Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 244, 54, 54),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.delete,
            size: 18,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
