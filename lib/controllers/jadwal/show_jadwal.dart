import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ShowJadwalMingguan {
  int id;
  final int id_hari;
  final String kode_jadwal;
  final String nama_jadwal;
  final int jam_mulai;
  final int jam_selesai;

  ShowJadwalMingguan({
    required this.id,
    required this.id_hari,
    required this.kode_jadwal,
    required this.nama_jadwal,
    required this.jam_mulai,
    required this.jam_selesai,

  });

  factory ShowJadwalMingguan.fromJson(Map<String, dynamic> json) {
    return ShowJadwalMingguan(
      id: json['id']?? 0,
      id_hari: json['id_hari'] ?? 0,
      kode_jadwal: json['kode_jadwal'] ?? "kosong",
      nama_jadwal: json['nama_jadwal'] ?? "kosong",
      jam_mulai: json['jam_mulai'] ?? 0,
      jam_selesai: json['jam_selesai'] ?? 0,
    );
  }
}

Future<List<ShowJadwalMingguan>> fetchdata(String idHari) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['RESERVASI'];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataNamaLab = prefs.getString('dataNamaLab');

    final response = await http.get(Uri.parse("$env/$dataNamaLab/$idHari"));

    if (response.statusCode == 200) {

      try {
        final List body = json.decode(response.body);
        return body.map((e) => ShowJadwalMingguan.fromJson(e)).toList();
      } catch (e) {
        throw Exception('failed');
      }
    }
  } catch (error) {
    throw Exception('Failed to load');
  }

  return [];
}
