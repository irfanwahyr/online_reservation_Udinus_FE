import 'package:flutter/material.dart';

class ButtonEditKecil extends StatelessWidget {
  final VoidCallback? onTap;

  const ButtonEditKecil({Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 168, 54),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.edit_outlined,
            size: 18,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
