import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
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
  PlatformFile? proposal_acara,
  PlatformFile? surat_peminjaman,
  String token) async {
  await dotenv.load(fileName: "../.env");
  final env = dotenv.env['ACARAORGANISASI'];

  final request = http.MultipartRequest('POST', Uri.parse("$env/create"));
  request.headers['Authorization'] = 'Bearer $token';
  request.headers['Accept'] = 'application/json';
  request.headers['Content-Type'] = 'application/json; charset=UTF-8';

  // Add form fields
  request.fields['nama_organisasi'] = nama_organisasi;
  request.fields['penanggung_jawab'] = penanggung_jawab;
  request.fields['no_whatssapp'] = no_whatssapp;
  request.fields['nama_acara'] = nama_acara;
  request.fields['nama_lab'] = nama_lab;
  request.fields['tanggal_mulai'] = tanggal_mulai;
  request.fields['tanggal_selesai'] = tanggal_selesai;
  request.fields['jam_mulai'] = jam_mulai;
  request.fields['jam_selesai'] = jam_selesai;
  request.fields['keterangan'] = keterangan;
  request.fields['id_user'] = id_user.toString();

  // Add files if available
  if (proposal_acara != null) {
    final fileBytes = kIsWeb
        ? proposal_acara.bytes!
        : File(proposal_acara.path!).readAsBytesSync();

    request.files.add(http.MultipartFile.fromBytes(
      'proposal_acara',
      fileBytes,
      filename: proposal_acara.name,
    ));
  }

  if (surat_peminjaman != null) {
    final fileBytes = kIsWeb
        ? surat_peminjaman.bytes!
        : File(surat_peminjaman.path!).readAsBytesSync();

    request.files.add(http.MultipartFile.fromBytes(
      'surat_peminjaman',
      fileBytes,
      filename: surat_peminjaman.name,
    ));
  }

  final streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);

  if (response.statusCode == 201) {
    return AcaraOrganisasi.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create event: ${response.body}');
  }
}