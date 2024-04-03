import 'package:flutter/material.dart';

class ButtonDenied extends StatelessWidget {
  const ButtonDenied({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showConfirmationDialog(context, false);
      },
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.cancel_outlined,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}

Future<bool?> _showConfirmationDialog(BuildContext context, bool pilihan) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: pilihan ? const Text('Apakah Anda Ingin Konfirmasi Peminjaman?') : const Text('Apakah Anda Ingin Menolak Peminjaman?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Tidak
              },
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                
                Navigator.of(context).pop(true); // Ya
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }
