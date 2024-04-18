import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SoftwareAdmin{
  final String software_1;
  final String software_2;
  final String software_3;
  final String software_4;
  final String software_5;
  final int id;
  final int id_lab;

  SoftwareAdmin({
    required this.software_1,
    required this.software_2,
    required this.software_3,
    required this.software_4,
    required this.software_5,
    required this.id,
    required this.id_lab,
  });

  factory SoftwareAdmin.fromJson(Map<String, dynamic> json) {
    return SoftwareAdmin(
      software_1: json['software_1'] ?? "kosong",
      software_2: json['software_2'] ?? "kosong",
      software_3: json['software_3'] ?? "kosong",
      software_4: json['software_4'] ?? "kosong",
      software_5: json['software_5'] ?? "kosong",
      id: json['id'] ?? 0,
      id_lab: json['id_lab'] ?? 0,
    );
  }
}

Future<SoftwareAdmin> update_software(
  String token,
  String software_1,
  String software_2,
  String software_3,
  String software_4,
  String software_5,
  int id,
  int id_lab,
  ) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['SOFTWARE'];
    final url = Uri.parse("$env/update/$id");

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final body = jsonEncode({
      'software_1': software_1,
      'software_2': software_2,
      'software_3': software_3,
      'software_4': software_4,
      'software_5': software_5,
      'id_lab': id_lab,
    });

    final response = await http.post(url, headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      return SoftwareAdmin.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update');
    }
  } catch (e) {
    rethrow;
  }
}