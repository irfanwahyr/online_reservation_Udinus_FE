import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ShowDataUsers{
  int id;
  final String username;
  final String email;
  final bool role;

  ShowDataUsers({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
  });

  factory ShowDataUsers.fromJson(Map<String, dynamic> json){
    return ShowDataUsers(id: json['id'] ?? 0,
      username: json['username'] ?? 'kosong',
      email: json['email'] ?? 'kosong',
      role: json['role'] ?? false
    );
  }
}

Future <List<ShowDataUsers>> fetchdata() async {

  try{
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['AUTH'];

    

    final response = await http.get(Uri.parse("$env/"));
    if (response.statusCode == 200) {
        try {
          final List body = json.decode(response.body);
          return body.map((e) => ShowDataUsers.fromJson(e)).toList();
        } catch (e) {
          throw Exception('failed');
        }
      }
  }catch (error) {
    throw Exception('Failed to load');
  }

  return [];
}

Future<void> deleteData(String id, String token) async {
  try {
    await dotenv.load(fileName: "../.env");
    final env = dotenv.env['AUTH'];
    final url = Uri.parse("$env/delete/$id");

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.post(url, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      print('Data deleted successfully');
    } else {
      throw Exception('Failed to delete data');
    }
  } catch (error) {
    throw Exception('Failed to delete data');
  }
}
