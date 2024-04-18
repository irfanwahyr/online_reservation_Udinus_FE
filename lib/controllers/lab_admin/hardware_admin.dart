import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HardwareAdmin{
  final String processor;
  final int ram;
  final String gpu;
  final int monitor;
  final String storage;
  final int id;

  HardwareAdmin({
    required this.processor,
    required this.ram,
    required this.gpu,
    required this.monitor,
    required this.storage,
    required this.id,
  });

  factory HardwareAdmin.fromJson(Map<String, dynamic> json) {
    return HardwareAdmin(
      processor: json['processor'] ?? "kosong",
      ram: json['ram'] ?? 0,
      gpu: json['gpu'] ?? "kosong",
      monitor: json['monitor'] ?? 0,
      storage: json['storage'] ?? "kosong",
      id: json['id'] ?? 0,
    );
  }
}

Future<HardwareAdmin> update_hardware(String processor, int ram, String gpu, int monitor, String storage, int id_lab, int id, String token) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['HARDWARE'];
    final url = Uri.parse("$env/update/$id");

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final body = jsonEncode({
      'processor': processor,
      'ram': ram,
      'gpu': gpu,
      'monitor': monitor,
      'storage': storage,
      'id_lab': id_lab,
    });

    final response = await http.post(url, headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      return HardwareAdmin.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Bukan 200');
    }
  } catch (error) {
    print(error);
    throw Exception('Failed to update data');
  }
}