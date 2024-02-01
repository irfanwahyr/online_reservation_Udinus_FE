import 'package:flutter/material.dart';

class FieldContainer extends StatelessWidget {
  final String judul;
  final String dataDikirim;
  const FieldContainer({super.key, required this.judul, required this.dataDikirim});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          judul,
          textAlign: TextAlign.start,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 5),
        Container(
          width: 400,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              // Menambah border ke dalam container
              color: Colors.black, // Warna border
              width: 0.5, // Lebar border
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              dataDikirim,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
