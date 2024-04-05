import 'package:flutter/material.dart';
import 'package:kp2024/controllers/jadwal/show_jadwal_admin.dart';
import 'package:kp2024/pages/admin/kontenDaftarMataKuliah/jadwalHari.dart';

class EditDaftarMataKuliah extends StatefulWidget {
  final String mata_kuliah;
  final String kelompok;
  final String token;
  final String jam_mulai;
  final String jam_selesai;
  final int id;
  final int id_hari;
  final Future? futureDataDaftarMataKuliah;

  EditDaftarMataKuliah(
      {
      required this.mata_kuliah,
      required this.kelompok,
      required this.token,
      required this.jam_mulai,
      required this.jam_selesai,
      required this.id,
      required this.id_hari,
      this.futureDataDaftarMataKuliah});

  @override
  State<EditDaftarMataKuliah> createState() => _EditDaftarMataKuliahState();
}

class _EditDaftarMataKuliahState extends State<EditDaftarMataKuliah> {
  TextEditingController? mataKuliahController = TextEditingController();
  TextEditingController? kelompokController = TextEditingController();

  @override
  void initState() {
    super.initState();
    mataKuliahController = TextEditingController(text: widget.mata_kuliah);
    kelompokController = TextEditingController(text: widget.kelompok);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Data'),
      content: SingleChildScrollView(
          child: FutureBuilder(
        future: widget.futureDataDaftarMataKuliah,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                    controller: mataKuliahController,
                    decoration: const InputDecoration(labelText: 'Nama Matkul'),
                ),
                TextFormField(
                    controller: kelompokController,
                    decoration: const InputDecoration(labelText: 'Kode Kelas'),
                ),
              ],
            );
          }
        },
      )),
      actions: [
        ElevatedButton(
          onPressed: () async {
            await update(
              mataKuliahController!.text,
              kelompokController!.text,
              widget.token,
              widget.id,
              widget.id_hari,
              widget.jam_mulai,
              widget.jam_selesai
            );
            Navigator.of(context).pop();
            Navigator.pushNamed(context, JadwalHari.nameRoute);
          },
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}
