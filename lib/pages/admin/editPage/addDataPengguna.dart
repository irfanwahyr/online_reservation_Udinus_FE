import 'package:flutter/material.dart';

class AddDataPengguna extends StatelessWidget {
  AddDataPengguna({Key? key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Tambah Data'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nama Pengguna'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {

            Navigator.of(context).pop();
          },
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}
