import 'package:flutter/material.dart';

class Hardware extends StatefulWidget {
  final String processor;
  final String ram;
  final String vga;
  final String monitor;
  final String keyboard;
  final String mouse;

  const Hardware({super.key, 
    required this.processor,
    required this.ram,
    required this.vga,
    required this.mouse,
    required this.keyboard,
    required this.monitor,
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
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "HARDWARE",
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
                    const TextSpan(
                      text: "Processor: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.processor),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    const TextSpan(
                      text: "RAM: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: "${widget.ram}GB"),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    const TextSpan(
                      text: "VGA: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.vga),
                  ],
                ),
              ),
              // Add more hardware details or icons as needed
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.mouse),
                  const SizedBox(width: 10),
                  Text(
                    widget.mouse,
                    style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.keyboard),
                  const SizedBox(width: 10),
                  Text(
                    widget.keyboard,
                    style: const TextStyle(fontFamily: "Lexend", fontSize: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
