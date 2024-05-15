import 'dart:convert';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

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
    int id_hari,
    int id_matkul,
    String default_mata_kuliah,
    String default_kelompok,
    String default_jamMulai,
    String default_jamSelesai,
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
      'id_jadwal': id_matkul
    })
  );
  if (response.statusCode == 201) {
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
      update_pinjam(token, id_matkul, kelompok, mata_kuliah, 3);
      id_matkul++;
    }
    return KelasPengganti.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}

Future<KelasPengganti> update_pinjam(
    String token,
    int id,
    String kelompok,
    String mata_kuliah,
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
      'kelompok': kelompok,
      'mata_kuliah': mata_kuliah,
      'id_pesan': id_pesan,
    })
  );
  print(response.body);
  print(response.statusCode);

  if (response.statusCode == 200) {
    return KelasPengganti.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}