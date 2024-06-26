import 'package:flutter/material.dart';

class ButtonAlasan extends StatelessWidget {
  final String alasan;
  ButtonAlasan({Key? key, required this.alasan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Tampilkan pop-up konfirmasi saat tombol ditekan
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Alasan"),
              content: Text(alasan),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Tutup pop-up
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 54, 187, 244),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.message_outlined,
            size: 18,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
