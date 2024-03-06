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
      id: json['id'] as int,
      nama_lab: json['nama_lab'] as String,
      jumlah_pc: json['jumlah_pc'] as int,
      jenis_lab: json['jenis_lab'] as String,
      deskripsi_lab: json['deskripsi_lab'] as String,
      software: List<Map<String, dynamic>>.from(
        json['software']?.map((softwares) => softwares as Map<String, dynamic>) ?? [],
      ),
    );
  }

  String getSoftwareName(int index) {
    if (index < software.length) {
      return software[index]['id'] ?? '';
    }
    return '';
  }
}

Future<DetailLab> fetchdata() async {
  await dotenv.load(fileName: "../.env");
  final env = dotenv.env['DETAIL_LAB'];

  String? idLab;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? nama_lab = prefs.getString('nama_lab');

  final response = await http.get(Uri.parse("$env/$nama_lab"));

  if (response.statusCode == 200) {
    return DetailLab.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}
