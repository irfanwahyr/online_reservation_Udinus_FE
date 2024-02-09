import 'package:flutter/material.dart';

class ButtonDelete extends StatelessWidget {
  const ButtonDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      label: Text(
        'Hapus',
        style: TextStyle(fontSize: 16, color: Colors.white),
        selectionColor: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 188, 23, 23),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Bentuk tombol bundar
        ),
      ),
    );
  }
}
