import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';

class PesananKuliahPengganti {
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

  PesananKuliahPengganti({
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

  factory PesananKuliahPengganti.fromJson(Map<String, dynamic> json) {
    return PesananKuliahPengganti(
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

Future<List<PesananKuliahPengganti>> getDataKuliahPengganti(String user_id) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['KELASPENGGANTI'];
    final response = await http.get(Uri.parse("$env/$user_id"));
    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body);
      if (responseData is List) {
        if (responseData.isEmpty) {
          return []; // Kembalikan daftar kosong jika data kosong
        }
        return responseData.map((e) => PesananKuliahPengganti.fromJson(e)).toList();
      } else if (responseData is Map<String, dynamic> && responseData.containsKey('message')) {
        // Kasus ketika server mengirim pesan bahwa tidak ada data
        return [];
      } else {
        throw Exception('Invalid data format received');
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    throw Exception('Failed to load data');
  }
}

Future<void> deletePesananKuliahPengganti(String id, String token) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['KULIAHPENGGANTI'];
    final url = Uri.parse("$env/delete/$id");

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.post(url, headers: headers);
    update_pinjam(token, id, 2);
    print(response.body);
    if (response.statusCode == 200) {
      print('Data deleted successfully');
    } else {
      throw Exception('Failed to delete data');
    }
  } catch (error) {
    throw Exception('Failed to delete data');
  }
}

Future<PesananKuliahPengganti> update_pinjam(
    String token,
    String id,
    int id_pesan,

  ) async {
  await dotenv.load(fileName: "../.env");
  final env = dotenv.env['RESERVASI'];
  final response = await http.patch(
    Uri.parse("$env/update_pinjam/$id"),
    headers: <String, String>{
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id_pesan': id_pesan,
    })
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    return PesananKuliahPengganti.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}