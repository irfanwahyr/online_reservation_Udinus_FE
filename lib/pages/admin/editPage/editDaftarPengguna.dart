import 'package:flutter/material.dart';

class EditDaftarPengguna extends StatelessWidget {
  final String username;
  final String email;
  final Future? futureDataDaftarPengguna;

  EditDaftarPengguna(
      {required this.username,
      required this.email,
      this.futureDataDaftarPengguna});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Data'),
      content: SingleChildScrollView(
        child: FutureBuilder(
          future: futureDataDaftarPengguna,
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
                    initialValue: username,
                    decoration: InputDecoration(labelText: 'Nama Pengguna'),
                  ),
                  TextFormField(
                    initialValue: email,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                ],
              );
            }
          },
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
