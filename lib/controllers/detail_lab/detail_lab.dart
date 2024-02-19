import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DetailLab {
  final int id;
  final String nama;
  final int jml_PC;
  final String jenis_lab;
  final List<Map<String, dynamic>> softwarePrimers;

  const DetailLab({
    required this.id,
    required this.nama,
    required this.jml_PC,
    required this.jenis_lab,
    required this.softwarePrimers,
  });

  factory DetailLab.fromJson(Map<String, dynamic> json) {
    return DetailLab(
      id: json['id'] as int,
      nama: json['nama'] as String,
      jml_PC: json['jml_PC'] as int,
      jenis_lab: json['jenis_lab'] as String,
      softwarePrimers: List<Map<String, dynamic>>.from(
        json['software_primers']?.map((software) => software as Map<String, dynamic>) ?? [],
      ),
    );
  }

  String getSoftwareName(int index) {
    if (index < softwarePrimers.length) {
      return softwarePrimers[index]['nama'] ?? '';
    }
    return '';
  }
}

Future<DetailLab> fetchdata() async {
  await dotenv.load(fileName: "../.env");
  final env = dotenv.env['DETAIL_LAB'];
  
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? dataNamaLab = prefs.getString('dataNamaLab');
  
  final response = await http.get(Uri.parse("$env/$dataNamaLab"));

  if (response.statusCode == 200) {
    return DetailLab.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}
