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
      id: json['id'] ?? 0,
      nama_lab: json['nama_lab'] ?? "kosong",
      jumlah_pc: json['jumlah_pc'] ?? 0,
      jenis_lab: json['jenis_lab'] ?? "kosong",
      software: json['software'] != null ? List<Map<String, dynamic>>.from(json['software']) : [],
      hardware: json['hardware'] != null ? List<Map<String, dynamic>>.from(json['hardware']) : [],
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

Future<LabData> update_lab(
  String nama_lab,
  int jumlah_pc,
  String jenis_lab,
  int id,
  String token,
  ) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['DETAIL_LAB'];
    final url = Uri.parse("$env/update/$id");

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final body = jsonEncode({
      'nama_lab': nama_lab,
      'jumlah_pc': jumlah_pc,
      'jenis_lab': jenis_lab,
    });

    final response = await http.post(url, headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      return LabData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update');
    }
  } catch (e) {
    print(e);
    rethrow;
  }
}