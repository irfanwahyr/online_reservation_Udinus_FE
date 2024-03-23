import 'package:flutter/material.dart';
import 'package:kp2024/controllers/peminjaman_admin/kelaspengganti_admin.dart';

class EditKuliahPengganti extends StatelessWidget {
  
  final int id;
  final String nama_dosen;
  final String mata_kuliah;
  final String kelompok;
  final String nama_lab;
  final String no_whatsapp;
  final String tanggal_pinjam;
  final String jam_mulai;
  final String jam_selesai;
  final String keterangan;
  final String token;
  final Future? futureDataEditKuliahPengganti;
  final TextEditingController nama_dosen_form;
  final TextEditingController mata_kuliah_form;
  final TextEditingController kelompok_form;
  final TextEditingController nama_lab_form;
  final TextEditingController no_whatsapp_form;
  final TextEditingController tanggal_pinjam_form;
  final TextEditingController jam_mulai_form;
  final TextEditingController jam_selesai_form;
  final TextEditingController keterangan_form;

  EditKuliahPengganti({
    required this.token,
    required this.id,
    required this.nama_dosen,
    required this.mata_kuliah,
    required this.kelompok,
    required this.nama_lab,
    required this.no_whatsapp,
    required this.tanggal_pinjam,
    required this.jam_mulai,
    required this.jam_selesai,
    required this.keterangan,
    this.futureDataEditKuliahPengganti,
  })  : nama_dosen_form = TextEditingController(text: nama_dosen),
        mata_kuliah_form = TextEditingController(text: mata_kuliah),
        kelompok_form = TextEditingController(text: kelompok),
        nama_lab_form = TextEditingController(text: nama_lab),
        no_whatsapp_form = TextEditingController(text: no_whatsapp),
        tanggal_pinjam_form = TextEditingController(text: tanggal_pinjam),
        jam_mulai_form = TextEditingController(text: jam_mulai),
        jam_selesai_form = TextEditingController(text: jam_selesai),
        keterangan_form = TextEditingController(text: keterangan);

  

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      title: Text('Edit Data'),
      content: SingleChildScrollView(
          child: FutureBuilder(
        future: futureDataEditKuliahPengganti,
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
              controller: nama_dosen_form,
              decoration: InputDecoration(labelText: 'Nama Dosen'),
            ),
            TextFormField(
              controller: mata_kuliah_form,
              decoration: InputDecoration(labelText: 'Mata Kuliah'),
            ),
            TextFormField(
              controller: kelompok_form,
              decoration: InputDecoration(labelText: 'Kelompok'),
            ),
            TextFormField(
              controller: nama_lab_form,
              decoration: InputDecoration(labelText: 'Nama Lab'),
            ),
            TextFormField(
              controller: no_whatsapp_form,
              decoration: InputDecoration(labelText: 'No Whatsapp'),
            ),
            TextFormField(
              controller: tanggal_pinjam_form,
              decoration: InputDecoration(labelText: 'Tanggal Pinjam'),
            ),
            TextFormField(
              controller: jam_mulai_form,
              decoration: InputDecoration(labelText: 'Jam Mulai'),
            ),
            TextFormField(
              controller: jam_selesai_form,
              decoration: InputDecoration(labelText: 'Jam Selesai'),
            ),
            TextFormField(
              controller: keterangan_form,
              decoration: InputDecoration(labelText: 'Keterangan'),
            ),
              ],
            );
          }
        },
      )),
      actions: [
        ElevatedButton(
          onPressed: () { 
            // Dapatkan nilai baru dari setiap TextFormField
            String nama_dosen_baru = nama_dosen_form.text;
            String mata_kuliah_baru = mata_kuliah_form.text;
            String kelompok_baru = kelompok_form.text;
            String nama_lab_baru = nama_lab_form.text;
            String no_whatsapp_baru = no_whatsapp_form.text;
            String tanggal_pinjam_baru = tanggal_pinjam_form.text;
            String jam_mulai_baru = jam_mulai_form.text;
            String jam_selesai_baru = jam_selesai_form.text;
            String keterangan_baru = keterangan_form.text;
            update(token, id, nama_dosen_baru, mata_kuliah_baru, kelompok_baru, no_whatsapp_baru, nama_lab_baru, tanggal_pinjam_baru, jam_mulai_baru, jam_selesai_baru, keterangan_baru);
            // Lakukan apa pun yang perlu dilakukan dengan nilai baru
            
            Navigator.of(context).pop();
          },
          child: Text('Simpan'),
        ),
      ],
    );
  }
}
