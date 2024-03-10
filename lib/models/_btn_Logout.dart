import 'package:flutter/material.dart';

class ButtonLogOut extends StatefulWidget {
  const ButtonLogOut({
    Key? key,
  }) : super(key: key);

  @override
  _ButtonLogOutState createState() => _ButtonLogOutState();
}

class _ButtonLogOutState extends State<ButtonLogOut> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onHover(true),
      onExit: (event) => onHover(false),
      child: ElevatedButton(
        onPressed: () {}, //ke halaman mana kalau udah logout
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isHovered ? Colors.grey.shade300 : Color.fromARGB(255, 255, 7, 7),
          minimumSize:
              const Size(100, 50), // Sesuaikan dengan ukuran yang diinginkan
        ),
        child: Text(
          "Logout",
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
