import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class KelasPenggantiAdmin {
  final int id;
  final String nama_dosen;
  final String mata_kuliah;
  final String kelompok;
  final String nama_lab;
  final String no_whatsapp;
  final String tanggal_mulai;
  final String jam_mulai;
  final String jam_selesai;
  final String keterangan;

  KelasPenggantiAdmin({
    required this.id,
    required this.nama_dosen,
    required this.mata_kuliah,
    required this.kelompok,
    required this.nama_lab,
    required this.no_whatsapp,
    required this.tanggal_mulai,
    required this.jam_mulai,
    required this.jam_selesai,
    required this.keterangan,
  });

  factory KelasPenggantiAdmin.fromJson(Map<String, dynamic> json) {
    return KelasPenggantiAdmin(
      id: json['id'] ?? 0,
      nama_dosen: json['nama_dosen'] ?? "kosong",
      mata_kuliah: json['mata_kuliah'] ?? "kosong",
      kelompok: json['kelompok'] ?? "kosong",
      no_whatsapp: json['no_whatsapp'] ?? "kosong",
      nama_lab: json['nama_lab'] ?? "kosong",
      tanggal_mulai: json['tanggal_mulai'] ?? "kosong",
      jam_mulai: json['jam_mulai'] ?? "kosong",
      jam_selesai: json['jam_selesai'] ?? "kosong",
      keterangan: json['keterangan'] ?? "kosong",
    );
  }
}

Future<List<KelasPenggantiAdmin>> fetchdata() async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['KELASPENGGANTI'];
    final response = await http.get(Uri.parse("$env/"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => KelasPenggantiAdmin.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    throw Exception('Failed to load data');
  }
}

Future<KelasPenggantiAdmin> update(String token, int id, String nama_dosen, String mata_kuliah, String kelompok, 
                                        String no_whatsapp, String nama_lab, String tanggal_mulai, String jam_mulai, 
                                        String jam_selesai, String keterangan) async {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['KELASPENGGANTI'];
    final response = await http.post(
      Uri.parse("$env/update/$id"),
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
      'nama_lab': nama_lab,
      'tanggal_mulai': tanggal_mulai,
      'jam_mulai': jam_mulai,
      'jam_selesai': jam_selesai,
      'keterangan': keterangan,
    })
  );
  if (response.statusCode == 200) {
    return KelasPenggantiAdmin.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}
 