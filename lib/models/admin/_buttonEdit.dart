import 'package:flutter/material.dart';

class ButtonEdit extends StatelessWidget {
  final VoidCallback? onPressed;
  const ButtonEdit({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.edit,
        color: Colors.white,
        size: 18,
      ),
      label: Text(
        'Edit',
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Bentuk tombol bundar
        ),
      ),
    );
  }
}
