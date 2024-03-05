import 'package:flutter/material.dart';

class EditKuliahPengganti extends StatelessWidget {
  final String nama_dosen;
  final String mata_kuliah;
  final String kelompok;
  final String nama_lab;
  final String no_whatsapp;
  final String tanggal_pinjam;
  final String jam_mulai;
  final String jam_selesai;
  final String keterangan;
  final Future? futureDataEditKuliahPengganti;

  EditKuliahPengganti(
      {required this.nama_dosen,
      required this.mata_kuliah,
      required this.kelompok,
      required this.nama_lab,
      required this.no_whatsapp,
      required this.tanggal_pinjam,
      required this.jam_mulai,
      required this.jam_selesai,
      required this.keterangan,
      this.futureDataEditKuliahPengganti});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Data'),
      content: SingleChildScrollView(
          child: FutureBuilder(
        future: futureDataEditKuliahPengganti,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: nama_dosen,
                  decoration: InputDecoration(labelText: 'Nama nama_dosen'),
                ),
                TextFormField(
                  initialValue: mata_kuliah,
                  decoration: InputDecoration(labelText: 'Mata Kuliah'),
                ),
                TextFormField(
                  initialValue: kelompok,
                  decoration: InputDecoration(labelText: 'kelompok'),
                ),
                TextFormField(
                  initialValue: nama_lab,
                  decoration: InputDecoration(labelText: 'nama_lab'),
                ),
                TextFormField(
                  initialValue: no_whatsapp,
                  decoration: InputDecoration(labelText: 'No Whatsapp'),
                ),
                TextFormField(
                  initialValue: tanggal_pinjam,
                  decoration: InputDecoration(labelText: 'Tanggal Pinjam'),
                ),
                TextFormField(
                  initialValue: jam_mulai,
                  decoration: InputDecoration(labelText: 'Jam Mulai'),
                ),
                TextFormField(
                  initialValue: jam_selesai,
                  decoration: InputDecoration(labelText: 'Jam Selesai'),
                ),
                TextFormField(
                  initialValue: keterangan,
                  decoration: InputDecoration(labelText: 'Keterangan'),
                ),
              ],
            );
          }
        },
      )),
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
