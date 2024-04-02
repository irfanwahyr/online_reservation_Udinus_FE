import 'package:flutter/material.dart';
import 'package:kp2024/controllers/peminjaman_admin/acaraorganisasi_admin.dart';

class ButtonSuratPinjam extends StatefulWidget {
  const ButtonSuratPinjam({super.key, required this.surat_peminjaman});
  final String surat_peminjaman;

  @override
  State<ButtonSuratPinjam> createState() => _ButtonSuratPinjamState();
}

class _ButtonSuratPinjamState extends State<ButtonSuratPinjam> {
  String? surat_peminjaman;
  @override
  void initState() {
    super.initState();
    surat_peminjaman = widget.surat_peminjaman;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showFile(surat_peminjaman!);
      },
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: Color.fromARGB(0, 71, 203, 19),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(Icons.picture_as_pdf_sharp, color: Colors.cyan),
        ),
      ),
    );
  }
}
