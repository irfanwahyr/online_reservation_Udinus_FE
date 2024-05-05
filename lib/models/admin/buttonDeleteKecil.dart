import 'package:flutter/material.dart';

class ButtonDeletedKecil extends StatelessWidget {
  final VoidCallback? onTap;

  ButtonDeletedKecil({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Tampilkan pop-up konfirmasi saat tombol ditekan
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Konfirmasi"),
              content: Text("Apakah Anda yakin ingin membatalkan pesanan?"),
              actions: [
                // Tombol Tidak
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Tutup pop-up
                  },
                  child: Text("Tidak"),
                ),
                // Tombol Ya
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Tutup pop-up
                    // Panggil fungsi deletePesananKuliahPengganti jika Ya ditekan
                    onTap?.call();
                  },
                  child: Text("Ya"),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 54, 54),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.delete,
            size: 18,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
