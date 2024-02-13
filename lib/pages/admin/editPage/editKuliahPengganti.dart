import 'package:flutter/material.dart';

class EditKuliahPengganti extends StatelessWidget {
  final String dosen;
  final String mataKuliah;
  final String kode;
  final String ruang;
  final String noWhatsapp;
  final String tanggalPinjam;
  final String jamMulai;
  final String jamSelesai;
  final String keterangan;

  EditKuliahPengganti({
    required this.dosen,
    required this.mataKuliah,
    required this.kode,
    required this.ruang,
    required this.noWhatsapp,
    required this.tanggalPinjam,
    required this.jamMulai,
    required this.jamSelesai,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Data'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: dosen,
              decoration: InputDecoration(labelText: 'Nama Dosen'),
            ),
            TextFormField(
              initialValue: mataKuliah,
              decoration: InputDecoration(labelText: 'Mata Kuliah'),
            ),
            TextFormField(
              initialValue: kode,
              decoration: InputDecoration(labelText: 'Kode'),
            ),
            TextFormField(
              initialValue: ruang,
              decoration: InputDecoration(labelText: 'Ruang'),
            ),
            TextFormField(
              initialValue: noWhatsapp,
              decoration: InputDecoration(labelText: 'No Whatsapp'),
            ),
            TextFormField(
              initialValue: tanggalPinjam,
              decoration: InputDecoration(labelText: 'Tanggal Pinjam'),
            ),
            TextFormField(
              initialValue: jamMulai,
              decoration: InputDecoration(labelText: 'Jam Mulai'),
            ),
            TextFormField(
              initialValue: jamSelesai,
              decoration: InputDecoration(labelText: 'Jam Selesai'),
            ),
            TextFormField(
              initialValue: keterangan,
              decoration: InputDecoration(labelText: 'Keterangan'),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Aksi yang dilakukan saat tombol "Simpan" ditekan
            // Lakukan sesuatu dengan data yang diubah, misalnya kirim ke database

            // Tutup pop-up
            Navigator.of(context).pop();
          },
          child: Text('Simpan'),
        ),
      ],
    );
  }
}
