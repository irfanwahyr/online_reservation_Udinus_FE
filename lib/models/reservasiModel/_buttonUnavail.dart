import 'package:flutter/material.dart';

class ButtonUnavailable extends StatefulWidget {
  const ButtonUnavailable({
    Key? key,
  }) : super(key: key);

  @override
  _ButtonUnavailableState createState() => _ButtonUnavailableState();
}

class _ButtonUnavailableState extends State<ButtonUnavailable> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: null,
      child: Text(
        "Unavailable",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}