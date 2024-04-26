import 'package:flutter/material.dart';

class AppBarUniversal extends StatelessWidget implements PreferredSizeWidget {
  final String username;
  final Function logoutCallback;

  const AppBarUniversal({
    Key? key,
    required this.username,
    required this.logoutCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        height: 100, // Mengurangi tinggi Container
        color: const Color.fromARGB(255, 1, 24, 50),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Add your app bar content here
              Text(
                "Selamat Datang",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.person_2_rounded, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    '$username',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              ElevatedButton.icon(
                onPressed: () {
                  logoutCallback();
                },
                icon: Icon(Icons.logout),
                label: Text("Logout"),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 1, 24, 50),
      toolbarHeight: 50, 
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(50); // Mengurangi tinggi preferredSize
}
