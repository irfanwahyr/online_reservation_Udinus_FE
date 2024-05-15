import 'package:flutter/material.dart';

class AppBarBack {
  final VoidCallback? onPressed;

  AppBarBack({required this.onPressed});

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: const Color.fromARGB(255, 1, 24, 50),
      title: Text(
        "Silahkan Login Atau Daftar Terlebih Dahulu",
        style: TextStyle(color: Colors.white),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onPressed,
      ),
      toolbarHeight: 50,
    );
  }
}
