import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class LabData {
  final int id;
  final String nama_lab;
  final int jumlah_pc;
  final String jenis_lab;
  final List<Map<String, dynamic>> software;
  final List<Map<String, dynamic>> hardware;

  LabData({
    required this.id,
    required this.nama_lab,
    required this.jumlah_pc,
    required this.jenis_lab,
    required this.software,
    required this.hardware,
  });

  factory LabData.fromJson(Map<String, dynamic> json) {
    return LabData(
      id: json['id'],
      nama_lab: json['nama_lab'] ?? "kosong",
      jumlah_pc: json['jumlah_pc'] ?? 0,
      jenis_lab: json['jenis_lab'] ?? "kosong",
      software: List<Map<String, dynamic>>.from(json['software']),
      hardware: List<Map<String, dynamic>>.from(json['hardware']),
    );
  }
}

Future<List<LabData>> fetchdata() async {

  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['DETAIL_LAB'];
    final response = await http.get(Uri.parse("$env/"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => LabData.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    throw Exception('Failed to load data');
  }
}
