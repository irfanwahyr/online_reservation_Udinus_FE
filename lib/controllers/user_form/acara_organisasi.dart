import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AcaraOrganisasi {
  final String nama_organisasi;
  final String penanggung_jawab;
  final String no_whatssapp;
  final String nama_acara;
  final String nama_lab;
  final String tanggal_mulai;
  final String tanggal_selesai;
  final String jam_mulai;
  final String jam_selesai;
  final String keterangan;
  final int id_user;
  final String proposal_acara;
  final String surat_peminjaman;

  AcaraOrganisasi({
    required this.nama_organisasi,
    required this.penanggung_jawab,
    required this.no_whatssapp,
    required this.nama_acara,
    required this.nama_lab,
    required this.tanggal_mulai,
    required this.tanggal_selesai,
    required this.jam_mulai,
    required this.jam_selesai,
    required this.keterangan,
    required this.id_user,
    required this.proposal_acara,
    required this.surat_peminjaman,
  });

  factory AcaraOrganisasi.fromJson(Map<String, dynamic> json){
    return AcaraOrganisasi(
      nama_organisasi: json['nama_organisasi'] ?? "kosong",
      penanggung_jawab: json['penanggung_jawab'] ?? "kosong",
      no_whatssapp: json['no_whatssapp'] ?? "kosong",
      nama_acara: json['nama_acara'] ?? "kosong",
      nama_lab: json['nama_lab'] ?? "kosong",
      tanggal_mulai: json['tanggal_mulai'] ?? "kosong",
      tanggal_selesai: json['tanggal_selesai'] ?? "kosong",
      jam_mulai: json['jam_mulai'] ?? "kosong",
      jam_selesai: json['jam_selesai'] ?? "kosong",
      keterangan: json['keterangan'] ?? "kosong",
      id_user: json['id_user'] ?? 0,
      proposal_acara: json['proposal_acara'] ?? "kosong",
      surat_peminjaman: json['surat_peminjaman'] ?? "kosong"
    );
  }


  Future<AcaraOrganisasi> create(
    String nama_organisasi,
    String penanggung_jawab,
    String no_whatssapp,
    String nama_acara,
    String nama_lab,
    String tanggal_mulai,
    String tanggal_selesai,
    String jam_mulai,
    String jam_selesai,
    String keterangan,
    int id_user,
    File proposal_acara,
    File surat_peminjaman,
    String token
  ) async {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['ACARAORGANISASI'];
    final response = await http.post(
      Uri.parse("$env/create"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nama_organisasi': nama_organisasi,
        'penanggung_jawab': penanggung_jawab,
        'no_whatssapp': no_whatssapp,
        'nama_acara': nama_acara,
        'nama_lab': nama_lab,
        'tanggal_mulai': tanggal_mulai,
        'tanggal_selesai': tanggal_selesai,
        'jam_mulai': jam_mulai,
        'jam_selesai': jam_selesai,
        'keterangan': keterangan,
        'id_user': id_user
      })
    );

    if (response.statusCode == 201){
      var responseData = json.decode(response.body);
      // Upload file proposal_acara
      final proposalResponse = await uploadFile(proposal_acara, responseData['id'], 'proposal_acara', token);
      // Upload file surat_peminjaman
      final suratResponse = await uploadFile(surat_peminjaman, responseData['id'], 'surat_peminjaman', token);
      if (proposalResponse.statusCode == 200 && suratResponse.statusCode == 200) {
          return AcaraOrganisasi.fromJson(jsonDecode(response.body));
        } else {
          throw Exception('Failed to upload proposal or letter');
        }
    } else {
      throw Exception('Failed to create event: ${response.body}');
    }
  }
}

Future<http.Response> uploadFile(File file, int eventId, String fieldName, String token) async {
  final env = dotenv.env['ACARAORGANISASI'];
  final request = http.MultipartRequest('POST', Uri.parse("$env/upload-file"));

  request.headers['Authorization'] = 'Bearer $token';
  request.fields['event_id'] = eventId.toString();
  request.fields['field_name'] = fieldName;

  request.files.add(await http.MultipartFile.fromPath(
    'file',
    file.path,
    filename: file.path.split('/').last,
  ));

  final streamedResponse = await request.send();
  return http.Response.fromStream(streamedResponse);
}