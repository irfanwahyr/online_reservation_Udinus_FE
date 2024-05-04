import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

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
  final int id_jadwal;

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
    required this.id_jadwal,
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
      id_jadwal: json['id_jadwal'] ?? 0,

    );
  }
}

Future<List<PesananKuliahPengganti>> getDataKuliahPengganti(String user_id) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['KELASPENGGANTI'];
    final response = await http.get(Uri.parse("$env/$user_id"));
    if (response.statusCode == 404) {
      return []; // Kembalikan daftar kosong jika data kosong
    }
    else if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body);
      if (responseData is List) {
        
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

Future<void> deletePesananKuliahPengganti(int id, int id_jadwal, String token, String jamMulai, String jamSelesai) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['KELASPENGGANTI'];
    final url = Uri.parse("$env/delete/$id");

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.post(url, headers: headers);
    if (response.statusCode == 200) {
      List<String> jamList = [
      "07.00",
      "07.50",
      "08.40",
      "09.30",
      "10.20",
      "11.10",
      "12.00",
      "12.30",
      "13.20",
      "14.10",
      "15.00",
      "16.20",
      "17.10",
      "18.30",
      "19.20",
      "20.10",
      "21.00"
    ];

    int a = 0, b = 0, c = 0;

    for (var i = 0; i < jamList.length; i++) {
      if(jamMulai == jamList[i]){
        a = i;
      }
      if(jamSelesai == jamList[i]){
        b = i;
        break;
      }
    }
    c = b - a;
    for (var i = 0; i < c; i++) {
      update_pinjam(token, id_jadwal, 1);
      id_jadwal++;
    }
    } else {
      throw Exception('Failed to delete data');
    }
  } catch (error) {
    throw Exception('Failed to delete data');
  }
}

Future<PesananKuliahPengganti> update_pinjam(
    String token,
    int id,
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
  if (response.statusCode == 200) {
    return PesananKuliahPengganti.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}