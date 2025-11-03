import 'package:aplikasibola_0024/register.dart';
import 'package:aplikasibola_0024/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _globalKey = GlobalKey<FormState>();
  final _emailCtr = TextEditingController();
  final _passwordCtr = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // icon & welcome text,
                  Image.asset('lib/images/logo.png', height: 180),
                  SizedBox(height: 30),
                  Text(
                    "Selamat Datang AmbaFans!",
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Silakan login untuk melanjutkan ke aplikasi",
                    style: TextStyle(fontSize: 18),
                  ),

                  // form login
                  SizedBox(height: 20),
                  // email field
                  TextFormField(
                    controller: _emailCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email tidak boleh kosong";
                      }
                      if (!RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      ).hasMatch(value)) {
                        return "Email tidak valid";
                      } else if (!value.contains("@gmail.com")) {
                        return "Email Harus berakhiran @gmail.com";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "contoh@email.com",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),

                  // password field
                  SizedBox(height: 21),
                  TextFormField(
                    controller: _passwordCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password tidak boleh kosong";
                      }
                      if (value.length < 6) {
                        return "Password minimal 6 karakter";
                      }
                      return null;
                    },
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                  ),

                  // login button
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (route) => false,
                        );
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ),

                  // register link
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Belum punya akun? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          "Daftar di sini!",
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
