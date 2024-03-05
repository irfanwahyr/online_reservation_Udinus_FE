import 'package:flutter/material.dart';

class EditDaftarMataKuliah extends StatelessWidget {
  final String hari;
  final String nama_lab;
  final String waktu_mulai;
  final String waktu_selesai;
  final String mata_kuliah;
  final String kelompok;
  final String nama_dosen;
  final Future? futureDataDaftarMataKuliah;

  EditDaftarMataKuliah(
      {required this.hari,
      required this.nama_lab,
      required this.waktu_mulai,
      required this.waktu_selesai,
      required this.mata_kuliah,
      required this.kelompok,
      required this.nama_dosen,
      this.futureDataDaftarMataKuliah});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Data'),
      content: SingleChildScrollView(
          child: FutureBuilder(
        future: futureDataDaftarMataKuliah,
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
                  initialValue: hari,
                  decoration: InputDecoration(labelText: 'Hari'),
                ),
                TextFormField(
                  initialValue: nama_lab,
                  decoration: InputDecoration(labelText: 'Nama Lab'),
                ),
                TextFormField(
                  initialValue: waktu_mulai,
                  decoration: InputDecoration(labelText: 'Waktu Mulai'),
                ),
                TextFormField(
                  initialValue: waktu_selesai,
                  decoration: InputDecoration(labelText: 'Waktu Selesai'),
                ),
                TextFormField(
                  initialValue: mata_kuliah,
                  decoration: InputDecoration(labelText: 'Nama Matkul'),
                ),
                TextFormField(
                  initialValue: kelompok,
                  decoration: InputDecoration(labelText: 'Kode Kelas'),
                ),
                TextFormField(
                  initialValue: nama_dosen,
                  decoration: InputDecoration(labelText: 'Nama Dosen'),
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

            Navigator.of(context).pop();
          },
          child: Text('Simpan'),
        ),
      ],
    );
  }
}
