import 'package:flutter/material.dart';

class EditDaftarLaboratorium extends StatelessWidget {
  final String nama_lab;
  final int jumlah_pc;
  final String jenis_lab;
  final String processor;
  final String ram;
  final String gpu;
  final String monitor;
  final String storage;
  final String software1;
  final String software2;
  final String software3;
  final String software4;
  final String software5;
  final Future? futureDataDaftarLaboratorium;

  EditDaftarLaboratorium(
      {required this.nama_lab,
      required this.jumlah_pc,
      required this.jenis_lab,
      required this.processor,
      required this.ram,
      required this.gpu,
      required this.monitor,
      required this.storage,
      required this.software1,
      required this.software2,
      required this.software3,
      required this.software4,
      required this.software5,
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
                  initialValue: jumlah_pc.toString(),
                  decoration: InputDecoration(labelText: 'Jumlah PC'),
                ),
                TextFormField(
                  initialValue: jumlah_pc.toString(),
                  decoration: InputDecoration(labelText: 'Jenis Lab'),
                ),
                TextFormField(
                  initialValue: processor,
                  decoration: InputDecoration(labelText: 'Processor'),
                ),
                TextFormField(
                  initialValue: ram,
                  decoration: InputDecoration(labelText: 'RAM'),
                ),
                TextFormField(
                  initialValue: gpu,
                  decoration: InputDecoration(labelText: 'GPU'),
                ),
                TextFormField(
                  initialValue: monitor,
                  decoration: InputDecoration(labelText: 'Monitor'),
                ),
                TextFormField(
                  initialValue: storage,
                  decoration: InputDecoration(labelText: 'Storage'),
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
