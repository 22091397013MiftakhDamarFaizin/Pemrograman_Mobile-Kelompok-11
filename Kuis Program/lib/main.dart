import 'package:flutter/material.dart';
import 'syntaxquiz.dart';
import 'frameworkquiz.dart';

void main() => runApp(QuizApp());

// Kelas QuizApp merupakan kelas StatelessWidget yang menjadi root dari seluruh aplikasi
class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengembalikan MaterialApp yang merupakan root dari aplikasi
    return MaterialApp(
      // Mengatur apakah banner debug ditampilkan
      debugShowCheckedModeBanner: false,
      // Mengatur judul aplikasi
      title: 'Kuis Pemrograman',
      // Mengatur halaman awal aplikasi
      home: HomePage(),
    );
  }
}

// Kelas HomePage merupakan kelas StatelessWidget yang menampilkan halaman utama aplikasi
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengembalikan Scaffold yang merupakan kerangka dasar dari halaman
    return Scaffold(
      // Mengatur AppBar yang merupakan bagian atas dari halaman
      appBar: AppBar(
        // Mengatur warna latar belakang AppBar
        backgroundColor: Color(0xFF161A30),
        // Menampilkan judul AppBar dengan Stack agar dapat mengatur posisi teks
        title: Stack(
          children: [
            Center(
              child: Text(
                'Kuis Pemrograman',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Color(0xFFF0ECE5),
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ],
        ),
      ),
      // Mengatur body halaman dengan Container untuk menambahkan dekorasi
      body: Container(
        // Mendekorasi Container dengan gradient
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF0ECE5),
              Color(0xFFB6BBC4),
            ],
          ),
        ),
        // Menampilkan konten tengah dari halaman
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  // Menampilkan kolom dengan daftar opsi kuis
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Column(
                        children: <Widget>[
                          // Menampilkan opsi kuis Syntax
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SyntaxQuiz()),
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.laptop, size: 150, color: Color(0xFF31304D)),
                                Text(
                                  'SYNTAX',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF31304D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          // Menampilkan opsi kuis Framework
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FrameworkQuiz()),
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.build, size: 150, color: Color(0xFF31304D)),
                                Text(
                                  'FRAMEWORK',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF31304D),
                                  ),
                                ),
                              ],
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
        ),
      ),
    );
  }
}
