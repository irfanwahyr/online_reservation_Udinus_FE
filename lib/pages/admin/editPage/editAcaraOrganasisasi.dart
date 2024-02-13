import 'package:flutter/material.dart';

class EditAcaraOrganisasi extends StatelessWidget {
  final String organisasi;
  final String penanggungJawab;
  final String noWhatsapp;
  final String namaAcara;
  final String ruang;
  final String tanggalMulai;
  final String tanggalSelesai;
  final String jamMulai;
  final String jamSelesai;
  final String keterangan;

  EditAcaraOrganisasi({
    required this.organisasi,
    required this.penanggungJawab,
    required this.noWhatsapp,
    required this.namaAcara,
    required this.ruang,
    required this.tanggalMulai,
    required this.tanggalSelesai,
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
              initialValue: organisasi,
              decoration: InputDecoration(labelText: 'Nama Organisasi'),
            ),
            TextFormField(
              initialValue: penanggungJawab,
              decoration: InputDecoration(labelText: 'Penanggung Jawab'),
            ),
            TextFormField(
              initialValue: noWhatsapp,
              decoration: InputDecoration(labelText: 'No Whatsapp'),
            ),
            TextFormField(
              initialValue: namaAcara,
              decoration: InputDecoration(labelText: 'namaAcara'),
            ),
            TextFormField(
              initialValue: ruang,
              decoration: InputDecoration(labelText: 'Ruang'),
            ),
            TextFormField(
              initialValue: tanggalMulai,
              decoration: InputDecoration(labelText: 'Tanggal Mulai'),
            ),
            TextFormField(
              initialValue: tanggalSelesai,
              decoration: InputDecoration(labelText: 'Tanggal Selesai'),
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

            
            Navigator.of(context).pop();
          },
          child: Text('Simpan'),
        ),
      ],
    );
  }
}
