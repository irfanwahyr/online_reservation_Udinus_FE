import 'package:flutter/material.dart';

class EditAcaraKampus extends StatelessWidget {
  final String fakultas;
  final String penanggungJawab;
  final String noWhatsapp;
  final String namaAcara;
  final String ruang;
  final String tanggalMulai;
  final String tanggalSelesai;
  final String jamMulai;
  final String jamSelesai;
  final String keterangan;
  final Future? futureDataAcaraKampus;

  EditAcaraKampus({
    required this.fakultas,
    required this.penanggungJawab,
    required this.noWhatsapp,
    required this.namaAcara,
    required this.ruang,
    required this.tanggalMulai,
    required this.tanggalSelesai,
    required this.jamMulai,
    required this.jamSelesai,
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
