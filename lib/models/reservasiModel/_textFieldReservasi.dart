import 'package:flutter/material.dart';

class TextFieldReservasi extends StatelessWidget {
  final String judul;
  final String hintText;
  final ValueChanged<String>? onSubmitted;
  final TextInputType keyboardType;
  final Future? futureData;
  const TextFieldReservasi(
      {super.key,
      required this.judul,
      required this.hintText,
      this.onSubmitted,
      this.futureData,
      required this.keyboardType});

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
        SizedBox(
          width: 400,
          height: 70,
          child: FutureBuilder(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); 
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return TextField(
                  decoration: InputDecoration(
                    labelText: hintText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(48, 142, 203, 252),
                  ),
                  keyboardType: keyboardType,
                  textInputAction: TextInputAction.done,
                  onSubmitted: onSubmitted,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
