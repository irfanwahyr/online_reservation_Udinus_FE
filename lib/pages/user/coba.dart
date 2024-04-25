// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Coba extends StatefulWidget {
//   @override
//   State<Coba> createState() => _CobaState();
// }

// class _CobaState extends State<Coba> {
//   String? labName;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton<String>(
//         dropdownColor: Color.fromARGB(211, 255, 255, 255),
//         value: labName,
//         onChanged: (String? newValue) async {
//           if (newValue != null) {
//             SharedPreferences prefs = await SharedPreferences.getInstance();
//             await prefs.setString('nama_lab', newValue);
//             laboratoriumYangDipilih = newValue;
//             labName = newValue;
//             setState(() {
//               labName = newValue;
//             });
//           }
//         },
//         icon: Icon(Icons.arrow_drop_down_circle_outlined),
//         style: TextStyle(
//           fontSize: fontSize,
//           color: Color.fromARGB(211, 0, 0, 0),
//         ),
//         items: <String>[
//           'A',
//           'B',
//           'C',
//           'D',
//           'E',
//           'G',
//           'H',
//           'I',
//           'J',
//           'K',
//           'L',
//           'M',
//           'N'
//         ].map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//         hint: Text("Pilih Laboratorium"),
//       ),
//     );
//   }
// }
