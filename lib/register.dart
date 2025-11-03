import 'package:flutter/material.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _globalKey = GlobalKey<FormState>();
  final _nameCtr = TextEditingController();
  final _emailCtr = TextEditingController();
  final _passwordCtr = TextEditingController();
  final _confPasswordCtr = TextEditingController();
  final _addressCtr = TextEditingController();
  final _phoneCtr = TextEditingController();
  int? _selectGender = 1;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          key: _globalKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // welcome text,
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Selamat Datang AmbaFans!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Silakan daftar untuk melanjutkan ke aplikasi",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),

                // form register
                SizedBox(height: 24),
                // name field
                TextFormField(
                  controller: _nameCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama lengkap tidak boleh kosong";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Nama Lengkap",
                    hintText: "Masukkan nama lengkap anda",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),

                // address field
                SizedBox(height: 15),
                TextFormField(
                  controller: _addressCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Alamat tidak boleh kosong";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Alamat",
                    hintText: "Masukkan alamat anda",
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),

                // phone field
                SizedBox(height: 15),
                TextFormField(
                  controller: _phoneCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "No. Telepon tidak boleh kosong";
                    }
                    if (!RegExp(r'^\+?[0-9]{10,12}$').hasMatch(value)) {
                      return "No. telepon tidak valid";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "No. Telepon",
                    hintText: "Masukkan no. telepon anda",
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),

                // gender field
                SizedBox(height: 15),
                Text("Jenis Kelamin ", textAlign: TextAlign.start),
                Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: _selectGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectGender = value;
                                  });
                                },
                              ),
                              Text("Laki-laki"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                value: 2,
                                groupValue: _selectGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectGender = value;
                                  });
                                },
                              ),
                              Text("Perempuan"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // email field
                SizedBox(height: 15),
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
                SizedBox(height: 15),
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

                // confirm password field
                SizedBox(height: 15),
                TextFormField(
                  controller: _confPasswordCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Konfirmasi password tidak boleh kosong";
                    }
                    if (value.length < 6) {
                      return "Password minimal 6 karakter";
                    }
                    if (value != _passwordCtr.text) {
                      return "Password tidak sesuai";
                    }
                    return null;
                  },
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    labelText: "Konfirmasi Password",
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

                // register button
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                    ),
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // login link
                SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sudah punya akun? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Masuk di sini!",
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
