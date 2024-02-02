import 'package:flutter/material.dart';

class AppBarBack {
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Back"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      toolbarHeight: 50,
    );
  }
}
