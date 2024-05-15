import 'package:flutter/material.dart';
import 'package:kp2024/controllers/login_signin/signinLogin.dart';
import 'package:kp2024/models/_appBarBack.dart';
import 'package:kp2024/models/_btnSubmit.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/_heading2.dart';
import 'package:kp2024/pages/admin/homePageAdmin.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogSign extends StatefulWidget {
  static const nameRoute = 'LogSign';
  const LogSign({Key? key}) : super(key: key);

  @override
  State<LogSign> createState() => _LogSignState();
}

class _LogSignState extends State<LogSign> {
  final TextEditingController emailControllersignup = TextEditingController();
  final TextEditingController passwordControllersignup =
      TextEditingController();
  final TextEditingController usernameControllersignup =
      TextEditingController();
  final TextEditingController emailControllerlogin = TextEditingController();
  final TextEditingController passwordControllerlogin = TextEditingController();

  bool _isPasswordVisibleSignup = false;
  bool _isPasswordVisibleLogin = false;

  String? emailSalah;
  String? passwordSalah;
  String? loginError;
  String? signupError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(onPressed: () {
        Navigator.pushReplacementNamed(context, Reservasi.nameRoute);
      }).buildAppBar(context),
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
    final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();

    return [
      SizedBox(
        width: 500,
        child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Heading1(text: "LOGIN", color: Colors.black),
              const SizedBox(height: 40),
              const Heading2(text: "Email", color: Colors.black),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(48, 142, 203, 252),
                  errorText: emailSalah,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                controller: emailControllerlogin,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Heading2(text: "Password", color: Colors.black),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(48, 142, 203, 252),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisibleLogin
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisibleLogin = !_isPasswordVisibleLogin;
                      });
                    },
                  ),
                  errorText: passwordSalah,
                ),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                controller: passwordControllerlogin,
                obscureText: !_isPasswordVisibleLogin,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    return 'Password minimal 6 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ButtonSubmit().buildButtonSubmit(
                  text: "Masuk",
                  onPressed: () async {
                    if (_loginFormKey.currentState!.validate()) {
                      String email = emailControllerlogin.text;
                      String password = passwordControllerlogin.text;
                      login(email, password).then((value) async {
                        SharedPreferences srf =
                            await SharedPreferences.getInstance();
                        srf.setString('token', value.token);
                        srf.setInt('id_user', value.id_user);
                        srf.setString('email', value.email);
                        srf.setString('username', value.username);
                        srf.setBool('role', value.role);
                        srf.setBool('isLoggedIn', true);
                        srf.setInt(
                            'loginTime', DateTime.now().millisecondsSinceEpoch);
                        if (srf.getBool('role') == false) {
                          Navigator.pushReplacementNamed(
                              context, Reservasi.nameRoute);
                        } else {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setInt('page_admin', 0);
                          Navigator.pushReplacementNamed(
                              context, HomePageAdmin.nameRoute);
                        }
                      }).catchError((error) {
                        setState(() {
                          if (error.toString().contains('email')) {
                            emailSalah = 'Email yang anda masukkan salah.';
                          }
                          // if (error.toString().contains('password')) {
                          //   passwordSalah = 'Password yang anda masukkan salah.';
                          // }
                          else {
                            // emailSalah = 'Email yang anda masukkan salah.';
                            passwordSalah =
                                'Password yang anda masukkan salah.';
                          }
                        });
                      });
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      const SizedBox(width: 20, height: 30),
      SizedBox(
        width: 500,
        child: Form(
          key: _signupFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Heading1(text: "SIGNUP", color: Colors.black),
              const SizedBox(height: 40),
              const Heading2(text: "Email", color: Colors.black),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(48, 142, 203, 252),
                  errorText: signupError,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                controller: emailControllersignup,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+.[^@]+').hasMatch(value)) {
                    return 'Email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Heading2(text: "Password", color: Colors.black),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(48, 142, 203, 252),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisibleSignup
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisibleSignup = !_isPasswordVisibleSignup;
                      });
                    },
                  ),
                  errorText: signupError,
                ),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                controller: passwordControllersignup,
                obscureText: !_isPasswordVisibleSignup,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    return 'Password minimal 6 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Heading2(text: "Nama Lengkap", color: Colors.black),
              const SizedBox(height: 10),
              TextFormField(
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama lengkap tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ButtonSubmit().buildButtonSubmit(
                  text: "Daftar",
                  onPressed: () {
                    if (_signupFormKey.currentState!.validate()) {
                      String email = emailControllersignup.text;
                      String password = passwordControllersignup.text;
                      String username = usernameControllersignup.text;
                      create(email, password, username, 0).catchError((error) {
                        setState(() {
                          signupError =
                              'Gagal membuat akun. Silakan coba lagi.';
                        });
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
