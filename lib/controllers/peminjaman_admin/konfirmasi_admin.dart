import 'dart:convert';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class KonfirmasiAdmin{
  
  final int id_user;

  KonfirmasiAdmin({
    
    required this.id_user,
  });

  factory KonfirmasiAdmin.fromJson(Map<String, dynamic> json) {
    return KonfirmasiAdmin(
      
      id_user: json['id_user'] ?? 0,
    );
  }
}
Future<KonfirmasiAdmin> konfirmasi_admin(
    String token,
    int id,
    int id_pesan,

  ) async {
  await dotenv.load(fileName: "../.env");
  final env = dotenv.env['RESERVASI'];
  final response = await http.patch(
    Uri.parse("$env/konfirmasi_admin/$id"),
    headers: <String, String>{
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id_pesan': id_pesan,
    })
  );

  print(response.body);
  print(response.statusCode);

  if (response.statusCode == 200) {
    return KonfirmasiAdmin.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}