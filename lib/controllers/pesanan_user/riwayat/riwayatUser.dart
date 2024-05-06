import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RiwayatUser {
  final int id;
  final String nama_keperluan;
  final String nama_lab;
  final String nama_acara;
  final String tanggal_mulai;
  final String tanggal_selesai;
  final String jam_mulai;
  final String jam_selesai;
  final String status;
  final int id_user;

  RiwayatUser({
    required this.id,
    required this.nama_keperluan,
    required this.nama_lab,
    required this.nama_acara,
    required this.tanggal_mulai,
    required this.tanggal_selesai,
    required this.jam_mulai,
    required this.jam_selesai,
    required this.status,
    required this.id_user,
  });

  factory RiwayatUser.fromJson(Map<String,dynamic> json) {
    return RiwayatUser(
      id: json['id'] ?? 0,
      nama_keperluan: json['nama_keperluan'] ?? 'kosong',
      nama_lab: json['nama_lab'] ?? 'kosong',
      nama_acara: json['nama_acara'] ?? 'kosong',
      tanggal_mulai: json['tanggal_mulai'] ?? 'kosong',
      tanggal_selesai: json['tanggal_selesai'] ?? 'kosong',
      jam_mulai: json['jam_mulai'] ?? 'kosong',
      jam_selesai: json['jam_selesai'] ?? 'kosong',
      status: json['status'] ?? false,
      id_user: json['id_user'] ?? 0,
    );
  }
}


Future<RiwayatUser> create(
  String token,
  int id_user,
  String nama_keperluan,
  String nama_lab,
  String nama_acara,
  String tanggal_mulai,
  String tanggal_selesai,
  String jam_mulai,
  String jam_selesai,
  String status,
  ) async{
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['RIWAYAT'];
    final response = await http.post(
      Uri.parse("$env/create"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_user': id_user,
        'nama_keperluan': nama_keperluan,
        'nama_lab': nama_lab,
        'nama_acara': nama_acara,
        'tanggal_mulai': tanggal_mulai,
        'tanggal_selesai': tanggal_selesai,
        'jam_mulai': jam_mulai,
        'jam_selesai': jam_selesai,
       'status': status,
      })
    );

    if (response.statusCode == 201){
      return RiwayatUser.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load');
    }
  }


  Future<RiwayatUser> getDataRiwayatByid(int id) async {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['RIWAYAT'];
    final response = await http.post(
      Uri.parse("$env/$id"),
    );

    if (response.statusCode == 201){
      return RiwayatUser.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load');
    }
  }