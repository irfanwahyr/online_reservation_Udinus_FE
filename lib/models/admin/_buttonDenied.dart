import 'package:flutter/material.dart';
import 'package:kp2024/controllers/peminjaman_admin/kelaspengganti_admin.dart';
import 'package:kp2024/controllers/pesanan_user/riwayat/riwayatUser.dart';

class ButtonDenied extends StatefulWidget {
  final int id;
  final String token;
  final String nama_acara;
  final String nama_lab;
  final String tanggal_mulai;
  final String tanggal_selesai;
  final String jam_mulai;
  final String jam_selesai;
  final int id_user;
  const ButtonDenied({
    super.key,
    required this.id,
    required this.token,
    required this.nama_acara,
    required this.nama_lab,
    required this.tanggal_mulai,
    required this.tanggal_selesai,
    required this.jam_mulai,
    required this.jam_selesai,
    required this.id_user,
    });

  @override
  State<ButtonDenied> createState() => _ButtonDeniedState();
}

class _ButtonDeniedState extends State<ButtonDenied> {
  bool _isAcc = false;
  TextEditingController alasan_controller = TextEditingController();
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
  Future<bool?> _showConfirmationDialog(BuildContext context, bool pilihan) async {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Apakah anda yakin untuk menolak pesanan ini ?'),
        content: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.purple),
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: alasan_controller,
            decoration: InputDecoration(
              hintText: 'Berikan alasan',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.black),
            maxLines: null, // Memungkinkan multiple lines
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Tidak
            },
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () {
              deleteDataKelasPengganti(widget.id.toString(), widget.token);
              _isAcc = false;
              create(
                widget.token,
                widget.id_user,
                widget.nama_lab,
                widget.nama_acara,
                widget.tanggal_mulai,
                widget.tanggal_selesai,
                widget.jam_mulai,
                widget.jam_selesai,
                _isAcc,
                alasan_controller.text,
                
              );
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


