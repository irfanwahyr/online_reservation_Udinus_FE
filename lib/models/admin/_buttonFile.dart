import 'package:flutter/material.dart';

class ButtonFile extends StatelessWidget {
  const ButtonFile({super.key});

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
          color: Color.fromARGB(0, 0, 191, 255),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(Icons.picture_as_pdf_sharp, color: Colors.blue),
        ),
      ),
    );
  }
}
