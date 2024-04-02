import 'package:flutter/material.dart';
import 'package:kp2024/controllers/login_signin/signinLogin.dart';
import 'package:kp2024/pages/homePage.dart';
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
        await logout();
        
        Navigator.pushReplacementNamed(context, HomePage.nameRoute);
      },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isHovered ? Colors.grey.shade300 : Color.fromARGB(255, 255, 7, 7),
          minimumSize:
              const Size(100, 50), // Sesuaikan dengan ukuran yang diinginkan
        ),
        child: Text(
          "Logout",
          style: TextStyle(
              color: isHovered
                  ? const Color.fromARGB(255, 1, 24, 50)
                  : Colors.white,
              fontSize: 18),
        ),
      ),
    );
  }

  void onHover(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
