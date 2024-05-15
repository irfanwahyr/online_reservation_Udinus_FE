import 'package:flutter/material.dart';
import 'package:kp2024/pages/logSign.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';

class AppBarUniversal extends StatelessWidget implements PreferredSizeWidget {
  final String username;
  final Function logoutCallback;
  final VoidCallback? pushnamed;
  final String token;

  const AppBarUniversal({
    Key? key,
    required this.username,
    required this.logoutCallback,
    required this.token,
    this.pushnamed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) {
          // Mendapatkan nama rute saat ini
          var currentRoute = ModalRoute.of(context)?.settings.name;

          // Menentukan ikon berdasarkan rute saat ini
          var icon = currentRoute == Reservasi.nameRoute
              ? Icons.refresh
              : Icons.arrow_back;

          // Menentukan aksi berdasarkan rute saat ini
          var onPressed = () {
            if (currentRoute == Reservasi.nameRoute) {
              // Segarkan halaman
              Navigator.pushReplacementNamed(context, Reservasi.nameRoute);
            } else {
              // Tindakan lainnya
              if (pushnamed != null) {
                pushnamed!();
              } else {
                Navigator.pushNamed(context, Reservasi.nameRoute);
              }
            }
          };
          return IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: onPressed,
          );
        },
      ),
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

              if (token.isEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.person_2_rounded, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Not Login yet',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              else
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
                  if (token.isEmpty) {
                    Navigator.pushNamed(
                        context,
                        LogSign
                            .nameRoute); // Ganti dengan rute halaman login Anda
                  } else {
                    logoutCallback();
                  }
                },
                icon: token.isEmpty ? Icon(Icons.login) : Icon(Icons.logout),
                label: token.isEmpty ? Text("Login") : Text("Logout"),
              ),
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
