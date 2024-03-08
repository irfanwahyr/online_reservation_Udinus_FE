import 'package:flutter/material.dart';
import 'package:kp2024/controllers/login_signin/signinLogin.dart';
import 'package:kp2024/models/_appBarBack.dart';
import 'package:kp2024/models/_btnSubmit.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/homePage.dart';

class LogSign extends StatefulWidget {
  static const nameRoute = 'LogSign';
  const LogSign({Key? key}) : super(key: key);

  @override
  State<LogSign> createState() => _LogSignState();
}

class _LogSignState extends State<LogSign> {
  final TextEditingController emailControllersignin = TextEditingController();
  final TextEditingController passwordControllersignin = TextEditingController();
  final TextEditingController usernameControllersignin = TextEditingController();
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
                  onPressed: () {
                    String email = emailControllerlogin.text;
                    String password = passwordControllerlogin.text;

                    login(email, password);
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
              controller: emailControllersignin,
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
              controller: passwordControllersignin,
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
              controller: usernameControllersignin,
              onSubmitted: (value) {
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ButtonSubmit().buildButtonSubmit(
                  text: "Daftar",
                  onPressed: () {
                    String email = emailControllersignin.text;
                    String password = emailControllersignin.text;
                    String username = usernameControllersignin.text;

                    create(
                      email,
                      password,
                      username,
                      0
                    );
                  }),
            )
          ],
        ),
      ),
    ];
  }
}
