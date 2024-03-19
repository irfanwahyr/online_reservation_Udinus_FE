import 'package:flutter/material.dart';
import 'package:kp2024/controllers/login_signin/signinLogin.dart';
import 'package:kp2024/models/_appBarBack.dart';
import 'package:kp2024/models/_btnSubmit.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/pages/admin/homePageAdmin.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogSign extends StatefulWidget {
  static const nameRoute = 'LogSign';
  const LogSign({Key? key}) : super(key: key);

  @override
  State<LogSign> createState() => _LogSignState();
}

class _LogSignState extends State<LogSign> {
  final TextEditingController emailControllersignup = TextEditingController();
  final TextEditingController passwordControllersignup = TextEditingController();
  final TextEditingController usernameControllersignup = TextEditingController();
  final TextEditingController emailControllerlogin = TextEditingController();
  final TextEditingController passwordControllerlogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(onPressed: (){Navigator.pushReplacementNamed(context, HomePage.nameRoute);}).buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 500,
              color: const Color.fromARGB(92, 145, 152, 149),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 700) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: buildLoginSignup(),
                      );
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: buildLoginSignup(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Footer().buildContainer(),
          ],
        ),
      ),
    );
  }

  List<Widget> buildLoginSignup() {
    return [
      SizedBox(
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Heading1(text: "LOGIN", color: Colors.black),
            const SizedBox(height: 40),
            const Heading2(text: "Email", color: Colors.black),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: const Color.fromARGB(48, 142, 203, 252),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              controller: emailControllerlogin,
              onSubmitted: (value) {
                // masukkan fungsi
              },
            ),
            const SizedBox(height: 20),
            const Heading2(text: "Password", color: Colors.black),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: const Color.fromARGB(48, 142, 203, 252),
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              controller: passwordControllerlogin,
              onSubmitted: (value) {
                // masukkan fungsi
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ButtonSubmit().buildButtonSubmit(
                  text: "Masuk",
                  onPressed: () async{
                    String email = emailControllerlogin.text;
                    String password = passwordControllerlogin.text;
                    await login(email, password).then((value) async {
                      SharedPreferences srf = await SharedPreferences.getInstance();
                      srf.setString('token', value.token);
                      srf.setInt('id_user', value.id_user);
                      srf.setString('email', value.email);
                      srf.setString('username', value.username);
                      srf.setBool('role', value.role);
                      if(srf.getBool('role') == false){
                        Navigator.pushReplacementNamed(context, HomePage.nameRoute);
                      }
                      else{
                        Navigator.pushReplacementNamed(context, HomePageAdmin.nameRoute);
                      }
                    });

                  }),
            )
          ],
        ),
      ),
      const SizedBox(width: 20, height: 30),
      SizedBox(
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Heading1(text: "SIGNUP", color: Colors.black),
            const SizedBox(height: 40),
            const Heading2(text: "Email", color: Colors.black),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: const Color.fromARGB(48, 142, 203, 252),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              controller: emailControllersignup,
              onSubmitted: (value) {
                // masukkan fungsi
              },
            ),
            const SizedBox(height: 20),
            const Heading2(text: "Password", color: Colors.black),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: const Color.fromARGB(48, 142, 203, 252),
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              controller: passwordControllersignup,
              onSubmitted: (value) {
                // masukkan fungsi
              },
            ),
            const SizedBox(height: 20),
            const Heading2(text: "Nama Lengkap", color: Colors.black),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan Nama Lengkap',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: const Color.fromARGB(48, 142, 203, 252),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              controller: usernameControllersignup,
              onSubmitted: (value) {
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ButtonSubmit().buildButtonSubmit(
                  text: "Daftar",
                  onPressed: () {
                    setState(() {
                      
                      String email = emailControllersignup.text;
                      String password = passwordControllersignup.text;
                      String username = usernameControllersignup.text;

                      create(
                        email,
                        password,
                        username,
                        0
                      );
                      
                    });
                  }),
            )
          ],
        ),
      ),
    ];
  }
}
