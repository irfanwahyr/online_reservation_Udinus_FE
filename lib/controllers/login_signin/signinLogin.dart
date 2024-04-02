import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kp2024/pages/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final int id_user;
  final String email;
  final String username;
  final bool role;

  Login({
    required this.token,
    required this.id_user,
    required this.email,
    required this.username,
    required this.role,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      token: json['token'],
      id_user: json['id'],
      email: json['email'],
      username: json['username'],
      role: json['role'],
    );
  }
}

Future<Login> login(String email, String password) async {
  late Timer _logoutTimer;
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
    const logoutTime = Duration(seconds: 30); // Ubah ke 30 detik
    _logoutTimer = Timer(logoutTime, () async {
      // Ketika timer mencapai 30 detik, panggil fungsi logout
      await logout();
    });
    return Login.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to login');
  }
}

Future<void> logout() async {
  await dotenv.load(fileName: "../.env");
  final env = dotenv.env['AUTH'];
  final response = await http.post(
    Uri.parse("$env/logout"),
  );

  if (response.statusCode == 200) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
  } else {
    throw Exception('Failed to logout');
  } 
}