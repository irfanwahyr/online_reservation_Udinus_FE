import 'dart:async';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Register {
  final String email;
  final String password;
  final String username;
  final int role;

  const Register(
    {
      required this.email,
      required this.password,
      required this.username,
      required this.role
    }
    );

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
      email: json['email'] ?? "kosong",
      password: json['password'] ?? "kosong",
      username: json['username'] ?? "kosong",
      role: json['role'] ?? 0,
    );
  }
}

Future<Register> create(String email, String password, String username, int role) async {
  await dotenv.load(fileName: "../.env");
  final env = dotenv.env['AUTH'];
  final response = await http.post(
    Uri.parse("$env/register"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
      'username': username,
      'role': role,
    })
  );

  if (response.statusCode == 201) {
    return Register.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}

class Login {
  final String token;

  Login({required this.token});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      token: json['token'],
    );
  }
}

Future<Login> login(String email, String password) async {
  await dotenv.load(fileName: "../.env");
  final env = dotenv.env['AUTH'];

  final response = await http.post(
    Uri.parse("$env/login"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return Login.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    print(response.statusCode);
    throw Exception('Failed to login');
  }
}


