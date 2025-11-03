import 'package:flutter/material.dart';
import 'home.dart';

class Detail extends StatefulWidget {
  final String nama;
  final String posisi;
  final int nomorPunggung;
  final String kewarganegaraan;
  final int usia;
  final double tinggi;
  final String jenisKelamin;

  const Detail({
    super.key,
    required this.nama,
    required this.posisi,
    required this.nomorPunggung,
    required this.kewarganegaraan,
    required this.usia,
    required this.tinggi,
    required this.jenisKelamin,
  });

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late double meter;

  @override
  void initState() {
    super.initState();
    meter = widget.tinggi / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pemain")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text("Name: ${widget.nama}"),
            SizedBox(height: 10),
            Text("Position: ${widget.posisi}"),
            SizedBox(height: 10),
            Text("Number: ${widget.nomorPunggung}"),
            SizedBox(height: 10),
            Text("Nation: ${widget.kewarganegaraan}"),
            SizedBox(height: 10),
            Text("Age: ${widget.usia}"),
            SizedBox(height: 10),
            Text("Height: ${meter} Meter"),
            SizedBox(height: 10),
            Text("Gender: ${widget.jenisKelamin}"),

            SizedBox(height: 20),

            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                  foregroundColor: Colors.black87,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
            ),

            SizedBox(height: 10),

            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white70,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    (route) => false,
                  );
                },
                child: Text("Save Data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
