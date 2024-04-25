import 'package:flutter/material.dart';

class Pesanan extends StatefulWidget {
  @override
  _PesananState createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  String? labName;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: labName,
      style: TextStyle(color: Colors.black),
      onChanged: (String? value) {
        setState(() {
          labName = value;
        });
      },
      items: <String>[
        'A',
        'B',
        'C',
        'D',
        'E',
        'G',
        'H',
        'I',
        'J',
        'K',
        'L',
        'M',
        'N',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(
        "Please choose a langauage",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
