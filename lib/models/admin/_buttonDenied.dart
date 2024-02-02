import 'package:flutter/material.dart';

class ButtonDenied extends StatelessWidget {
  const ButtonDenied({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // fungsi tolak disini wer
      },
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 36, 151, 40),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
