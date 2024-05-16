import 'package:flutter/material.dart';
import 'package:kp2024/controllers/peminjaman_admin/acaraorganisasi_admin.dart';
import 'package:kp2024/controllers/peminjaman_admin/kelaspengganti_admin.dart';
import 'package:kp2024/controllers/peminjaman_admin/konfirmasi_admin.dart';
import 'package:kp2024/controllers/pesanan_user/riwayat/riwayatUser.dart';
import 'package:kp2024/controllers/user_form/kelas_pengganti.dart';

class ButtonAccOrganisasi extends StatefulWidget {
  final int id;
  final String token;
  final String nama_acara;
  final String nama_lab;
  final String tanggal_mulai;
  final String tanggal_selesai;
  final String jam_mulai;
  final String jam_selesai;
  final String alasan;
  final int id_user;
  final int id_jadwal;

  const ButtonAccOrganisasi(
      {super.key,
      required this.id,
      required this.token,
      required this.nama_acara,
      required this.nama_lab,
      required this.tanggal_mulai,
      required this.tanggal_selesai,
      required this.jam_mulai,
      required this.jam_selesai,
      required this.alasan,
      required this.id_user,
      required this.id_jadwal});

  @override
  State<ButtonAccOrganisasi> createState() => _ButtonAccOrganisasiState();
}

class _ButtonAccOrganisasiState extends State<ButtonAccOrganisasi> {
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
                List<String> ListJamMulai = [
                "07.00",
                "07.50",
                "08.40",
                "09.30",
                "10.20",
                "11.10",
                "12.30",
                "13.20",
                "14.10",
                "15.00",
                "16.20",
                "17.10",
                "18.30",
                "19.20",
                "20.10",
              ];

              List<String> ListJamSelesai = [
                "07.50",
                "08.40",
                "09.30",
                "10.20",
                "11.10",
                "12.00",
                "13.20",
                "14.10",
                "15.00",
                "15.50",
                "17.10",
                "18.00",
                "19.20",
                "20.10",
                "21.00",
              ];

              int a = 0, b = 0, c = 0;

              for (var j = 0; j < ListJamSelesai.length; j++) {
                if(widget.jam_mulai == ListJamMulai[j]){
                  a = j;
                }
                if(widget.jam_selesai == ListJamSelesai[j]){
                  b = j+1;
                  break;
                }
              }
              c = b - a;
              int id_jadwal = widget.id_jadwal;
              deleteDataAcaraOrganisasi(widget.id.toString(), widget.token);
              _isAcc = true;
              create_riwayat(
                  widget.token,
                  widget.id_user,
                  widget.nama_lab,
                  widget.nama_acara,
                  widget.tanggal_mulai,
                  widget.tanggal_selesai,
                  widget.jam_mulai,
                  widget.jam_selesai,
                  _isAcc,
                  widget.alasan,
                  widget.id_jadwal);
              for (var k = 0; k <= c; k++) {
                konfirmasi_admin(widget.token, id_jadwal, 2);
                print("Update id jadwal " + id_jadwal.toString());
                id_jadwal++;
              }
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
