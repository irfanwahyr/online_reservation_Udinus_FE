import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import 'package:universal_html/html.dart' as universal_html;

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
    );
  }
}

Future<List<AdminAcaraOrganisasi>> fetchdata() async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['ACARAORGANISASI'];
    final response = await http.get(Uri.parse("$env/"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => AdminAcaraOrganisasi.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    throw Exception('Failed to load data');
  }
}

Future<void> showFile(String token, String namaFile) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['SHOWFILE'];
    final response = await http.get(Uri.parse("$env/$namaFile"));
    if (response.statusCode == 200) {
      // Membuat objek Blob dari isi file
      final blob = universal_html.Blob([response.bodyBytes]);

      // Membuat URL untuk objek Blob
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Membuka file dalam tab baru
      html.window.open(url, "_blank");
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    print(error);
    throw Exception('Failed to load data');
  }
}

// Future<AdminAcaraOrganisasi> update(String token, int id, String nama_organisasi, String penanggung_jawab, String nama_acara, 
//                                         String no_whatsapp, String nama_lab, String tanggal_mulai, String jam_mulai, 
//                                         String jam_selesai, String keterangan) async {
//     await dotenv.load(fileName: "../.env");
//     final env = dotenv.env['KELASPENGGANTI'];
//     final response = await http.post(
//       Uri.parse("$env/update/$id"),
//       headers: <String, String>{
//         'Authorization': 'Bearer $token',
//         'Accept': 'application/json',
//         'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, dynamic>{
//       'nama_organisasi': nama_organisasi,
//       'penanggung_jawab': penanggung_jawab,
//       'nama_acara': nama_acara,
//       'no_whatsapp': no_whatsapp,
//       'nama_lab': nama_lab,
//       'tanggal_mulai': tanggal_mulai,
//       'jam_mulai': jam_mulai,
//       'jam_selesai': jam_selesai,
//       'keterangan': keterangan,
//     })
//   );
//   if (response.statusCode == 200) {
//     return AdminAcaraOrganisasi.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     throw Exception('Failed to load');
//   }
// }
 