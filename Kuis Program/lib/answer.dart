import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler; 
  final String answerText; 

  Answer(this.selectHandler, this.answerText); // Konstruktor untuk menginisialisasi properti jawaban.

  @override
  Widget build(BuildContext context) {
    // Metode ini membangun UI untuk widget Answer.
    return Padding(
      // Padding di sekitar tombol.
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity, // Tombol mengambil lebar penuh.
        child: ElevatedButton(
          onPressed: () => selectHandler(), 
          child: Text(answerText), // Menampilkan teks jawaban pada tombol.
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF31304D), // Warna latar belakang tombol.
            foregroundColor: Color(0xFFF0ECE5), // Warna teks tombol.
            padding: EdgeInsets.symmetric(vertical: 15), // Padding vertikal dalam tombol.
            shape: StadiumBorder(), // Bentuk tombol (StadiumBorder memberikan pinggiran melengkung).
          ),
        ),
      ),
    );
  }
}
