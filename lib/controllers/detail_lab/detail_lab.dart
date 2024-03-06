import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DetailLab {
  final int id;
  final String nama_lab;
  final int jumlah_pc;
  final String jenis_lab;
  final String deskripsi_lab;
  final List<Map<String, dynamic>> software;

  const DetailLab({
    required this.id,
    required this.nama_lab,
    required this.jumlah_pc,
    required this.jenis_lab,
    required this.deskripsi_lab,
    required this.software,
  });

  factory DetailLab.fromJson(Map<String, dynamic> json) {
    return DetailLab(
      id: json['id'] ?? 0,
      nama_lab: json['nama_lab'] ?? "kosong",
      jumlah_pc: json['jumlah_pc'] ?? "kosong",
      jenis_lab: json['jenis_lab'] ?? "kosong",
      deskripsi_lab: json['deskripsi_lab'] ?? "kosong",
      software: List<Map<String, dynamic>>.from(
        json['software']?.map((softwares) => softwares as Map<String, dynamic>) ?? [],
      ),
    );
  }
}

Future<DetailLab> fetchdata() async {
  await dotenv.load(fileName: "../.env");
  final env = dotenv.env['DETAIL_LAB'];

  // String? idLab;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? nama_lab = prefs.getString('nama_lab');
  if (nama_lab == "A") {
    nama_lab = "1";
  }
  final response = await http.get(Uri.parse("$env/$nama_lab"));

  if (response.statusCode == 200) {
    return DetailLab.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}
