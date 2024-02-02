import 'package:flutter/material.dart';

class ButtonAcc extends StatelessWidget {
  const ButtonAcc({super.key});

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
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.cancel_outlined,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
