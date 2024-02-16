import 'package:flutter/material.dart';
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
                      // Jika lebar layar lebih besar dari 700, tampilkan sebagai row
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: buildLoginSignup(),
                      );
                    } else {
                      // Jika lebar layar kurang dari atau sama dengan 700, tampilkan sebagai column
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
              onSubmitted: (value) {
                // masukkan fungsi
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ButtonSubmit().buildButtonSubmit(
                  nama: "Masuk",
                  onPressed: () {
                    //fungsi mu wer
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
              onSubmitted: (value) {
                // masukkan fungsi
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ButtonSubmit().buildButtonSubmit(
                  nama: "Daftar",
                  onPressed: () {
                    //fungsi mu wer
                  }),
            )
          ],
        ),
      ),
    ];
  }
}
