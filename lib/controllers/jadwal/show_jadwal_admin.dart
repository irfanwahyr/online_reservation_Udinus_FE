import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ShowJadwalMingguanAdmin {
  int id;
  final int id_hari;
  final String kelompok;
  final String mata_kuliah;
  final String jam_mulai;
  final String jam_selesai;

  ShowJadwalMingguanAdmin({
    required this.id,
    required this.id_hari,
    required this.kelompok,
    required this.mata_kuliah,
    required this.jam_mulai,
    required this.jam_selesai,

  });

  factory ShowJadwalMingguanAdmin.fromJson(Map<String, dynamic> json) {
    return ShowJadwalMingguanAdmin(
      id: json['id']?? 0,
      id_hari: json['id_hari'] ?? 0,
      kelompok: json['kelompok'] ?? "kosong",
      mata_kuliah: json['mata_kuliah'] ?? "kosong",
      jam_mulai: json['jam_mulai'] ?? 0,
      jam_selesai: json['jam_selesai'] ?? 0,
    );
  }
}

Future<List<ShowJadwalMingguanAdmin>> fetchdata(String idHari) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['RESERVASI'];

    // Jika idHari adalah 7 (Minggu), kembalikan list kosong
    if (idHari == "7") {
      return [];
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataNamaLab = prefs.getString('nama_lab');
    final response = await http.get(Uri.parse("$env/$dataNamaLab/$idHari"));

    if (response.statusCode == 200) {
      try {
        final List body = json.decode(response.body);
        return body.map((e) => ShowJadwalMingguanAdmin.fromJson(e)).toList();
      } catch (e) {
        throw Exception('failed');
      }
    }
  } catch (error) {
    throw Exception('Failed to load');
  }

  return [];
}

Future<ShowJadwalMingguanAdmin> update(
  String mata_kuliah,
  String kelompok,
  String token,
  int id,
  int id_hari,
  String jam_mulai,
  String jam_selesai
  ) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['RESERVASI'];
    final url = Uri.parse("$env/update/$id");

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final body = jsonEncode(<String, dynamic>{
      'id_hari': id_hari,
      'mata_kuliah': mata_kuliah,
      'kelompok': kelompok,
      jam_mulai: jam_mulai,
      jam_selesai: jam_selesai,
    });

    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return ShowJadwalMingguanAdmin.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      print(response.statusCode);
      throw Exception('Failed to update');
    }
  } catch (e) {
    rethrow;
  }
}