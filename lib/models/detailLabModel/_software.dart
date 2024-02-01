import 'package:flutter/material.dart';

class Software extends StatefulWidget {
  final String software_1;
  final String software_2;
  final String software_3;
  final String? software_4;
  final String? software_5;
  final String? software_6;
  final String? software_7;
  final String? software_8;

  const Software({super.key, 
    required this.software_1,
    required this.software_2,
    required this.software_3,
    this.software_4,
    this.software_5,
    this.software_6,
    this.software_7,
    this.software_8,
  });

  @override
  State<Software> createState() => _SoftwareState();
}

class _SoftwareState extends State<Software> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        width: 550,
        height: 550,
        decoration: BoxDecoration(
            color: const Color.fromARGB(97, 45, 125, 76),
            borderRadius: BorderRadius.circular(20)),
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
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    TextSpan(text: widget.software_1),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    TextSpan(text: widget.software_2),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    TextSpan(text: widget.software_3),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    TextSpan(text: widget.software_4),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    TextSpan(text: widget.software_5),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    TextSpan(text: widget.software_6),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    TextSpan(text: widget.software_7),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    TextSpan(text: widget.software_8),
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
