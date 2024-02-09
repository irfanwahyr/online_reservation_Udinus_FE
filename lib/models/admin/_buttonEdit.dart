import 'package:flutter/material.dart';

class ButtonEdit extends StatelessWidget {
  const ButtonEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Tambahkan aksi yang ingin dilakukan ketika tombol ditekan
      },
      icon: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      label: Text(
        'Edit',
        style: TextStyle(fontSize: 16, color: Colors.white),
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
