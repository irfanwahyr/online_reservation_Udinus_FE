import 'package:flutter/material.dart';

class Hardware extends StatefulWidget {
  final List<String> hardwareNames;

  const Hardware({super.key,
    required this.hardwareNames,
  });

  @override
  State<Hardware> createState() => _HardwareState();
}

class _HardwareState extends State<Hardware> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        width: 550,
        height: 550,
        decoration: BoxDecoration(
          color: const Color.fromARGB(97, 45, 125, 76),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "SOFTWARE",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              // Membuat loop untuk menampilkan semua softwareNames
              for (String hardwareName in widget.hardwareNames)
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                    children: [
                      TextSpan(text: hardwareName),
                    ],
                  ),
                ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
