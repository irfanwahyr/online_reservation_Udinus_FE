import 'dart:convert';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kp2024/controllers/jadwal/show_jadwal_admin.dart';

class KelasPengganti{
  final String nama_dosen;
  final String mata_kuliah;
  final String kelompok;
  final String no_whatsapp;
  final String nama_lab;
  final String tanggal_mulai;
  final String jam_mulai;
  final String jam_selesai;
  final String keterangan;
  final int id_user;

  KelasPengganti({
    required this.nama_dosen,
    required this.mata_kuliah,
    required this.kelompok,
    required this.no_whatsapp,
    required this.nama_lab,
    required this.tanggal_mulai,
    required this.jam_mulai,
    required this.jam_selesai,
    required this.keterangan,
    required this.id_user,
  });

  factory KelasPengganti.fromJson(Map<String, dynamic> json) {
    return KelasPengganti(
      nama_dosen: json['nama_dosen'] ?? "kosong",
      mata_kuliah: json['mata_kuliah'] ?? "kosong",
      kelompok: json['kelompok'] ?? "kosong",
      no_whatsapp: json['no_whatsapp'] ?? "kosong",
      nama_lab: json['nama_lab'] ?? "kosong",
      tanggal_mulai: json['tanggal_mulai'] ?? "kosong",
      jam_mulai: json['jam_mulai'] ?? "kosong",
      jam_selesai: json['jam_selesai'] ?? "kosong",
      keterangan: json['keterangan'] ?? "kosong",
      id_user: json['id_user'] ?? 0,
    );
  }
}

Future<KelasPengganti> create(
    String nama_dosen,
    String mata_kuliah,
    String kelompok,
    String no_whatsapp,
    String namaLab,
    String tanggalMulai,
    String jamMulai,
    String jamSelesai,
    String keterangan,
    int idUser,
    String token,
    int id_pesan,
    int id_hari,
    int id_matkul
  ) async {
  await dotenv.load(fileName: "../.env");
  final env = dotenv.env['KELASPENGGANTI'];
  final response = await http.post(
    Uri.parse("$env/create"),
    headers: <String, String>{
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nama_dosen': nama_dosen,
      'mata_kuliah': mata_kuliah,
      'kelompok': kelompok,
      'no_whatsapp': no_whatsapp,
      'nama_lab': namaLab,
      'tanggal_mulai': tanggalMulai,
      'jam_mulai': jamMulai,
      'jam_selesai': jamSelesai,
      'keterangan': keterangan,
      'id_user': idUser,
    })
  );
  if (response.statusCode == 201) {
    if(id_pesan.toString() == '2') {
      update(mata_kuliah, kelompok, token, id_matkul, id_hari, 3, jamMulai, jamSelesai);
    } else if(id_pesan.toString() == '3') {
      update(mata_kuliah, kelompok, token, id_matkul, id_hari, 1, jamMulai, jamSelesai);
    } else {
      update(mata_kuliah, kelompok, token, id_matkul, id_hari, 2, jamMulai, jamSelesai);
    }
    return KelasPengganti.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}