import 'package:flutter/material.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasiContent.dart';

class HoverButtonPrimary extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const HoverButtonPrimary({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _HoverButtonPrimaryState createState() => _HoverButtonPrimaryState();
}

class _HoverButtonPrimaryState extends State<HoverButtonPrimary> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onHover(true),
      onExit: (event) => onHover(false),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Konfirmasi"),
                content: const Text("Apakah data yang Anda input sudah benar?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Edit"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      widget.onPressed
                          ?.call();
                      Navigator.pushReplacementNamed(context, Reservasi.nameRoute);
                    },
                    child: const Text("Submit"),
                  ),
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isHovered
              ? Colors.grey.shade300
              : const Color.fromARGB(255, 255, 168, 7),
          minimumSize:
              const Size(100, 50),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
              color: isHovered
                  ? const Color.fromARGB(255, 1, 24, 50)
                  : Colors.white,
              fontSize: 18),
        ),
      ),
    );
  }

  void onHover(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
