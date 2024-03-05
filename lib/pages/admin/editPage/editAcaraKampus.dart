import 'package:flutter/material.dart';

class EditAcaraKampus extends StatelessWidget {
  final String fakultas;
  final String penanggung_jawab;
  final String no_whatsapp;
  final String nama_acara;
  final String nama_lab;
  final String tanggal_mulai;
  final String tanggal_selesai;
  final String jam_mulai;
  final String jam_selesai;
  final String keterangan;
  final Future? futureDataAcaraKampus;

  EditAcaraKampus({
    required this.fakultas,
    required this.penanggung_jawab,
    required this.no_whatsapp,
    required this.nama_acara,
    required this.nama_lab,
    required this.tanggal_mulai,
    required this.tanggal_selesai,
    required this.jam_mulai,
    required this.jam_selesai,
    required this.keterangan,
    this.futureDataAcaraKampus,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Data'),
      content: SingleChildScrollView(
        child: FutureBuilder(
          future: futureDataAcaraKampus,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue: fakultas,
                    decoration: InputDecoration(labelText: 'Nama fakultas'),
                  ),
                  TextFormField(
                    initialValue: penanggung_jawab,
                    decoration: InputDecoration(labelText: 'Penanggung Jawab'),
                  ),
                  TextFormField(
                    initialValue: no_whatsapp,
                    decoration: InputDecoration(labelText: 'No Whatsapp'),
                  ),
                  TextFormField(
                    initialValue: nama_acara,
                    decoration: InputDecoration(labelText: 'nama_acara'),
                  ),
                  TextFormField(
                    initialValue: nama_lab,
                    decoration: InputDecoration(labelText: 'nama_lab'),
                  ),
                  TextFormField(
                    initialValue: tanggal_mulai,
                    decoration: InputDecoration(labelText: 'Tanggal Mulai'),
                  ),
                  TextFormField(
                    initialValue: tanggal_selesai,
                    decoration: InputDecoration(labelText: 'Tanggal Selesai'),
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
          }),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // fungsi taruh sini wer

            Navigator.of(context).pop();
          },
          child: Text('Simpan'),
        ),
      ],
    );
  }
}
