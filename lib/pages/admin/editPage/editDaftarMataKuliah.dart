import 'package:flutter/material.dart';

class EditDaftarMataKuliah extends StatelessWidget {
  final String hari;
  final String namaLab;
  final String waktuMulai;
  final String waktuSelesai;
  final String namaMatkul;
  final String kodeKelas;
  final String dosenPengampu;
  final Future? futureDataDaftarMataKuliah;

  EditDaftarMataKuliah(
      {required this.hari,
      required this.namaLab,
      required this.waktuMulai,
      required this.waktuSelesai,
      required this.namaMatkul,
      required this.kodeKelas,
      required this.dosenPengampu,
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
                  initialValue: namaLab,
                  decoration: InputDecoration(labelText: 'Nama Lab'),
                ),
                TextFormField(
                  initialValue: waktuMulai,
                  decoration: InputDecoration(labelText: 'Waktu Mulai'),
                ),
                TextFormField(
                  initialValue: waktuSelesai,
                  decoration: InputDecoration(labelText: 'Waktu Selesai'),
                ),
                TextFormField(
                  initialValue: namaMatkul,
                  decoration: InputDecoration(labelText: 'Nama Matkul'),
                ),
                TextFormField(
                  initialValue: kodeKelas,
                  decoration: InputDecoration(labelText: 'Kode Kelas'),
                ),
                TextFormField(
                  initialValue: dosenPengampu,
                  decoration: InputDecoration(labelText: 'dosen Pengampu'),
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
