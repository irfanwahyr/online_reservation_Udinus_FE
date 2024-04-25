import 'package:flutter/material.dart';

class HeadingJudul extends StatelessWidget {
  final String text;
  final Color color;

  const HeadingJudul({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue, // Warna background
        borderRadius: BorderRadius.circular(10.0), // Bentuk border (opsional)
      ),
      padding: EdgeInsets.all(10.0), // Padding untuk konten di dalam Container
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white, // Warna teks
          fontSize: 15, // Ukuran teks
        ),
      ),
    );
  }
}
