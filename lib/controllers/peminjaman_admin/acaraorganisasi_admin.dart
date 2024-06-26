import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;


class AdminAcaraOrganisasi {
  final int id;
  final String nama_organisasi;
  final String penanggung_jawab;
  final String nama_acara;
  final String nama_lab;
  final String no_whatsapp;
  final String tanggal_mulai;
  final String tanggal_selesai;
  final String jam_mulai;
  final String jam_selesai;
  final String proposal_acara;
  final String surat_peminjaman;
  final String keterangan;
  final int id_user;
  final int id_jadwal;

  AdminAcaraOrganisasi({
    required this.id,
    required this.nama_organisasi,
    required this.penanggung_jawab,
    required this.nama_acara,
    required this.nama_lab,
    required this.no_whatsapp,
    required this.tanggal_mulai,
    required this.tanggal_selesai,
    required this.jam_mulai,
    required this.jam_selesai,
    required this.proposal_acara,
    required this.surat_peminjaman,
    required this.keterangan,
    required this.id_user,
    required this.id_jadwal
  });

  factory AdminAcaraOrganisasi.fromJson(Map<String, dynamic> json) {
    return AdminAcaraOrganisasi(
      id: json['id'] ?? 0,
      nama_organisasi: json['nama_organisasi'] ?? "kosong",
      penanggung_jawab: json['penanggung_jawab'] ?? "kosong",
      no_whatsapp: json['no_whatssapp'] ?? "kosong",
      nama_acara: json['nama_acara'] ?? "kosong",
      nama_lab: json['nama_lab'] ?? "kosong",
      tanggal_mulai: json['tanggal_mulai'] ?? "kosong",
      tanggal_selesai: json['tanggal_selesai'] ?? "kosong",
      jam_mulai: json['jam_mulai'] ?? "kosong",
      jam_selesai: json['jam_selesai'] ?? "kosong",
      proposal_acara: json['proposal_acara'] ?? "kosong",
      surat_peminjaman: json['surat_peminjaman'] ?? "kosong",
      keterangan: json['keterangan'] ?? "kosong",
      id_user: json['id_user'] ?? 0,
      id_jadwal: json['id_jadwal'] ?? 0,
    );
  }
}

Future<List<AdminAcaraOrganisasi>> fetchdata() async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['ACARAORGANISASI'];
    final response = await http.get(Uri.parse("$env/"));
    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body);
      if (responseData is List) {
        if (responseData.isEmpty) {
          return []; // Kembalikan daftar kosong jika data kosong
        }
        return responseData.map((e) => AdminAcaraOrganisasi.fromJson(e)).toList();
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

Future<void> showFile(String namaFile) async {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['SHOWFILE'];
    html.window.open("$env/$namaFile", "_blank");
}

Future<void> deleteDataAcaraOrganisasi(String id, String token) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['ACARAORGANISASI'];
    final url = Uri.parse("$env/delete/$id");

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.post(url, headers: headers);
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

