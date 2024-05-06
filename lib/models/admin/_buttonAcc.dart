import 'package:flutter/material.dart';
import 'package:kp2024/controllers/pesanan_user/riwayat/riwayatUser.dart';

class ButtonAcc extends StatefulWidget {
  const ButtonAcc({super.key, 
  required this.token, 
  required this.nama_acara, 
  required this.nama_lab, 
  required this.tanggal_mulai, 
  required this.tanggal_selesai, 
  required this.jam_mulai, 
  required this.jam_selesai, 
  required this.alasan, 
  required this.id_user});

  final String token;
  final String nama_acara;
  final String nama_lab;
  final String tanggal_mulai;
  final String tanggal_selesai;
  final String jam_mulai;
  final String jam_selesai;
  final String alasan;
  final int id_user;

  @override
  State<ButtonAcc> createState() => _ButtonAccState();
}

class _ButtonAccState extends State<ButtonAcc> {
  bool _isAcc = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showConfirmationDialog(context);
      },
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 36, 151, 40),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  Future<bool?> _showConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda Ingin Konfirmasi Peminjaman?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Tidak
              },
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                _isAcc = true;
                create(widget.token, widget.id_user, widget.nama_lab, widget.nama_acara, widget.tanggal_mulai, widget.tanggal_selesai, widget.jam_mulai, widget.jam_selesai, _isAcc, widget.alasan);
                Navigator.of(context).pop(true); // Ya
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}

