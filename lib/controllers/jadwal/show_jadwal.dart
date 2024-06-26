import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ShowJadwalMingguan {
  int id;
  final int id_hari;
  final int id_pesan;
  final String kelompok;
  final String mata_kuliah;
  final String jam_mulai;
  final String jam_selesai;

  ShowJadwalMingguan({
    required this.id,
    required this.id_hari,
    required this.id_pesan,
    required this.kelompok,
    required this.mata_kuliah,
    required this.jam_mulai,
    required this.jam_selesai,
  });

  factory ShowJadwalMingguan.fromJson(Map<String, dynamic> json) {
    return ShowJadwalMingguan(
      id: json['id'] ?? 0,
      id_hari: json['id_hari'] ?? 0,
      id_pesan: json['id_pesan'] ?? 1,
      kelompok: json['kelompok'] ?? "kosong",
      mata_kuliah: json['mata_kuliah'] ?? "kosong",
      jam_mulai: json['jam_mulai'] ?? "kosong",
      jam_selesai: json['jam_selesai'] ?? "kosong",
    );
  }
}

Future<List<ShowJadwalMingguan>> fetchdata(String idHari, String nama_lab) async {
  // print(idHari + nama_lab);
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['RESERVASI'];

    // Jika idHari adalah 7 (Minggu), kembalikan list kosong
    if (idHari == "7") {
      return [];
    }

    final response = await http.get(Uri.parse("$env/$nama_lab/$idHari"));

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
