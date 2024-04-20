import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/models/_heading3.dart';
import 'package:kp2024/pages/homePage.dart';

class AppBarLogin extends StatelessWidget implements PreferredSizeWidget {
  final String namaUser;
  final String imageAsset;
  const AppBarLogin({
    required this.namaUser,
    required this.imageAsset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ), // Icon yang akan ditampilkan di sebelah kiri app bar
        onPressed: () {
          Navigator.pushReplacementNamed(context, HomePage.nameRoute);
        },
      ),
      title: Container(
        height: 50,
        color: const Color.fromARGB(255, 1, 24, 50),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Heading2(text: "Selamat Datang", color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Heading3(text: namaUser, color: Colors.white),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: Image.asset(imageAsset),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 1, 24, 50),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
