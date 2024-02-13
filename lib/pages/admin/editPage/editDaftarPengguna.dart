import 'package:flutter/material.dart';

class EditDaftarPengguna extends StatelessWidget {
  final String namaPengguna;
  final String email;
  final String password;

  EditDaftarPengguna({
    required this.namaPengguna,
    required this.email,
    required this.password,
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
              initialValue: namaPengguna,
              decoration: InputDecoration(labelText: 'Nama Pengguna'),
            ),
            TextFormField(
              initialValue: email,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              initialValue: password,
              decoration: InputDecoration(labelText: 'Password'),
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
