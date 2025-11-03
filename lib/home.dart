import 'package:flutter/material.dart';
import 'form.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('lib/images/logo.png'),
        ),
        title: const Center(
          child: Text("Amba App", style: TextStyle(color: Colors.white)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Fungsi untuk tombol settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Jadwal Pertandingan Amba FC",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Amba FC",
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            "VS",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            "Arema FC",
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Tanggal: 25 Desember 2025",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Waktu: 16:00 WIB",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Lokasi: Stadion Lautan Api",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Menu",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Player
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TambahPemain(),
                        ),
                      );
                    },
                    child: Column(
                      children: const [
                        Icon(Icons.person, size: 40, color: Colors.black87),
                        SizedBox(height: 8),
                        Text("Player", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                  // Jadwal
                  Column(
                    children: const [
                      Icon(Icons.schedule, size: 40, color: Colors.black87),
                      SizedBox(height: 8),
                      Text("Jadwal", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  // Klasemen
                  Column(
                    children: const [
                      Icon(Icons.bar_chart, size: 40, color: Colors.black87),
                      SizedBox(height: 8),
                      Text("Klasemen", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  // Merchandise
                  Column(
                    children: const [
                      Icon(Icons.store, size: 40, color: Colors.black87),
                      SizedBox(height: 8),
                      Text("Merchandise", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                "Berita Terbaru Amba FC",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 250,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Amba FC Resmi Rekrut Pemain Baru",
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Amba FC telah resmi merekrut pemain baru untuk memperkuat skuad mereka di musim depan. Pemain tersebut diharapkan.......... Baca selengkapnya",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
