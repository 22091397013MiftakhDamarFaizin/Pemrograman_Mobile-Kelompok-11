import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetHandler;

  Result(this.score, this.resetHandler);

  // Widget untuk menampilkan pesan berdasarkan nilai skor.
  Widget resultPhraseWidget(int score) {
    if (score == 100) {
      return Column(
        children: [
          Image.asset('assets/thropy.png'), // Menampilkan gambar trofi jika nilai skor 100.
          Text(
            'Selamat, kamu mendapat nilai $score!',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else {
      String resultText;
      if (score >= 60) {
        resultText = 'Selamat, kamu mendapat nilai $score!';
      } else {
        resultText = 'Kamu mendapat nilai $score, kamu bisa lebih baik!';
      }
      return Text(
        resultText,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              resultPhraseWidget(score), // Menampilkan widget pesan berdasarkan nilai skor.
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()), // Mengarahkan kembali ke halaman utama saat tombol ditekan.
                        (Route<dynamic> route) => false,
                  );
                },
                child: Text('Mulai lagi'), // Tombol untuk memulai kembali pada aplikasi.
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF31304D)),
                  foregroundColor: MaterialStateProperty.all<Color>(Color(0xFFF0ECE5)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
