import 'package:flutter/material.dart';
// import 'home.dart';
import 'detail.dart';

class TambahPemain extends StatefulWidget {
  const TambahPemain({super.key});

  @override
  State<TambahPemain> createState() => _TambahPemainState();
}

class _TambahPemainState extends State<TambahPemain> {
  final _globalKey = GlobalKey<FormState>();
  final _namaCtr = TextEditingController();
  final _posisiCtr = TextEditingController();
  final _nomorPunggungCtr = TextEditingController();
  final _kewarganegaraanCtr = TextEditingController();
  final _usiaCtr = TextEditingController();
  final _tinggiCtr = TextEditingController();
  int? _selectGender = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Tombol kembali (otomatis ditambahkan oleh Navigator)
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Tambah Pemain Baru",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // teks
                Text(
                  "Form untuk menambahkan pemain baru",
                  style: TextStyle(fontSize: 16),
                ),

                // Nama pemain
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _namaCtr,
                  decoration: InputDecoration(labelText: "Nama Pemain"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama pemain tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                // Posisi pemain
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _posisiCtr,
                  decoration: InputDecoration(labelText: "Posisi Pemain"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Posisi pemain tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                // Nomor punggung
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _nomorPunggungCtr,
                  decoration: InputDecoration(labelText: "Nomor Punggung"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor punggung tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Nomor punggung harus berupa angka';
                    }
                    return null;
                  },
                ),

                // kewarganegaraan
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _kewarganegaraanCtr,
                  decoration: InputDecoration(
                    labelText: "Kewarganegaraan Pemain",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kewarganegaraan tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                // usia pemain
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _usiaCtr,
                  decoration: InputDecoration(labelText: "Usia Pemain"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Usia pemain tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Usia harus berupa angka';
                    }
                    return null;
                  },
                ),

                // tinggi pemain
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _tinggiCtr,
                  decoration: InputDecoration(labelText: "Tinggi Pemain (cm)"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tinggi pemain tidak boleh kosong';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Tinggi harus berupa angka';
                    }
                    return null;
                  },
                ),

                // jenis kelamin
                SizedBox(height: 16.0),
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

                // tombol submit
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
                            builder: (context) => Detail(
                              nama: _namaCtr.text,
                              posisi: _posisiCtr.text,
                              nomorPunggung: int.parse(_nomorPunggungCtr.text),
                              kewarganegaraan: _kewarganegaraanCtr.text,
                              usia: int.parse(_usiaCtr.text),
                              tinggi: double.parse(_tinggiCtr.text),
                              jenisKelamin: _selectGender == 1 ? 'Laki-laki' : 'Perempuan',
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Tambah Pemain",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
