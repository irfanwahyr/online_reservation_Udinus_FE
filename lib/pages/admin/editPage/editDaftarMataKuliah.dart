import 'package:flutter/material.dart';

class EditDaftarMataKuliah extends StatelessWidget {
  final String waktu_mulai;
  final String waktu_selesai;
  final String mata_kuliah;
  final String kelompok;
  final Future? futureDataDaftarMataKuliah;

  EditDaftarMataKuliah(
      {
      required this.waktu_mulai,
      required this.waktu_selesai,
      required this.mata_kuliah,
      required this.kelompok,
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
                  initialValue: mata_kuliah,
                  decoration: InputDecoration(labelText: 'Nama Matkul'),
                ),
                TextFormField(
                  initialValue: kelompok,
                  decoration: InputDecoration(labelText: 'Kode Kelas'),
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
