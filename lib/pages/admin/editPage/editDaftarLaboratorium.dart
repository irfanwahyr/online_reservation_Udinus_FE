import 'package:flutter/material.dart';

class EditDaftarLaboratorium extends StatelessWidget {
  final String nama_lab;
  final String jumlah_pc;
  final String ram;
  final String memori;
  final String gpu;
  final String monitor;
  final String storage;
  final String software1;
  final String software2;
  final String software3;
  final String software4;
  final String software5;
  final String software6;
  final String software7;
  final String software8;
  final String software9;
  final String software10;
  final Future? futureDataDaftarLaboratorium;

  EditDaftarLaboratorium(
      {required this.nama_lab,
      required this.jumlah_pc,
      required this.ram,
      required this.memori,
      required this.gpu,
      required this.monitor,
      required this.storage,
      required this.software1,
      required this.software2,
      required this.software3,
      required this.software4,
      required this.software5,
      required this.software6,
      required this.software7,
      required this.software8,
      required this.software9,
      required this.software10,
      this.futureDataDaftarLaboratorium});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Data'),
      content: SingleChildScrollView(
          child: FutureBuilder(
        future: futureDataDaftarLaboratorium,
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
                  initialValue: nama_lab,
                  decoration: InputDecoration(labelText: 'Laboratorium'),
                ),
                TextFormField(
                  initialValue: jumlah_pc,
                  decoration: InputDecoration(labelText: 'Jumlah PC'),
                ),
                TextFormField(
                  initialValue: ram,
                  decoration: InputDecoration(labelText: 'ram'),
                ),
                TextFormField(
                  initialValue: memori,
                  decoration: InputDecoration(labelText: 'memori'),
                ),
                TextFormField(
                  initialValue: gpu,
                  decoration: InputDecoration(labelText: 'gpu'),
                ),
                TextFormField(
                  initialValue: gpu,
                  decoration: InputDecoration(labelText: 'monitor'),
                ),
                TextFormField(
                  initialValue: gpu,
                  decoration: InputDecoration(labelText: 'storage'),
                ),
                TextFormField(
                  initialValue: software1,
                  decoration: InputDecoration(labelText: 'software 1'),
                ),
                TextFormField(
                  initialValue: software2,
                  decoration: InputDecoration(labelText: 'software 2'),
                ),
                TextFormField(
                  initialValue: software3,
                  decoration: InputDecoration(labelText: 'software 3'),
                ),
                TextFormField(
                  initialValue: software4,
                  decoration: InputDecoration(labelText: 'software 4'),
                ),
                TextFormField(
                  initialValue: software5,
                  decoration: InputDecoration(labelText: 'software 5'),
                ),
                TextFormField(
                  initialValue: software6,
                  decoration: InputDecoration(labelText: 'software 6'),
                ),
                TextFormField(
                  initialValue: software7,
                  decoration: InputDecoration(labelText: 'software 7'),
                ),
                TextFormField(
                  initialValue: software8,
                  decoration: InputDecoration(labelText: 'software 8'),
                ),
                TextFormField(
                  initialValue: software9,
                  decoration: InputDecoration(labelText: 'software9'),
                ),
                TextFormField(
                  initialValue: software10,
                  decoration: InputDecoration(labelText: 'software10'),
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
