import 'package:flutter/material.dart';
import 'package:kp2024/controllers/login_signin/signinLogin.dart';
import 'package:kp2024/pages/logSign.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonLogOut extends StatefulWidget {
  const ButtonLogOut({
    Key? key,
  }) : super(key: key);

  @override
  _ButtonLogOutState createState() => _ButtonLogOutState();
}

class _ButtonLogOutState extends State<ButtonLogOut> {
  bool isHovered = false;
  String? token;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    setState(() {
      this.token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onHover(true),
      onExit: (event) => onHover(false),
      child: ElevatedButton(
        onPressed: () async {
          // Tampilkan dialog konfirmasi
          bool? logoutConfirmed = await _showLogoutConfirmationDialog(context);
          if (logoutConfirmed ?? false) {
            await logout();
            SharedPreferences srf = await SharedPreferences.getInstance();
            srf.setBool('isLoggedIn', false);
            srf.setString('token', '');
            srf.setInt('id_user', 0);
            srf.setString('username', 'username');
            srf.setBool('role', false);
            Navigator.pushReplacementNamed(context, LogSign.nameRoute);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isHovered ? Colors.grey.shade300 : Color.fromARGB(255, 255, 7, 7),
          minimumSize:
              const Size(80, 40),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5)
          
        ),
        child: Text(
          "Logout",
          style: TextStyle(
              color: isHovered
                  ? const Color.fromARGB(255, 1, 24, 50)
                  : Colors.white,
              fontSize: 13),
        ),
      ),
    );
  }

  void onHover(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  Future<bool?> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah Anda yakin ingin logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Tidak
              },
              child: Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Ya
              },
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}
