import 'package:flutter/material.dart';

class Hardware extends StatefulWidget {
  final String processor;
  final String ram;
  final String vga;
  final String monitor;
  final String keyboard;
  final String mouse;

  Hardware({
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
            color: Color.fromARGB(97, 45, 125, 76),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "HARDWARE",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    TextSpan(
                      text: "Processor: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.processor),
                  ],
                ),
              ),
              SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    TextSpan(
                      text: "RAM: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: "${widget.ram}GB"),
                  ],
                ),
              ),
              SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontFamily: "Lexend", fontSize: 30),
                  children: [
                    TextSpan(
                      text: "VGA: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.vga),
                  ],
                ),
              ),
              // Add more hardware details or icons as needed
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mouse),
                  SizedBox(width: 10),
                  Text(
                    widget.mouse,
                    style: TextStyle(fontFamily: "Lexend", fontSize: 30),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.keyboard),
                  SizedBox(width: 10),
                  Text(
                    widget.keyboard,
                    style: TextStyle(fontFamily: "Lexend", fontSize: 30),
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
