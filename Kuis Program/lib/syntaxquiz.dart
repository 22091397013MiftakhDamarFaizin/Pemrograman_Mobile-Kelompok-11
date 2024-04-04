import 'dart:async';
import 'package:flutter/material.dart';
import 'question.dart';
import 'result.dart';

class SyntaxQuiz extends StatefulWidget {
  @override
  _SyntaxQuizState createState() => _SyntaxQuizState();
}

//Variabel untuk menyimpan indeks pertanyaan dan skor dan mengatur timer
class _SyntaxQuizState extends State<SyntaxQuiz> {
  int _questionIndex = 0;
  int _score = 0;
  Timer? _timer;
  int _timeInSeconds = 10;

  @override
  //Mengatur tampilan AppBar dan susunan pertanyaan, timer, dan nilai.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kuis Syntax',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFF0ECE5)),
        ),
        backgroundColor: Color(0xFF161A30),
        leading: BackButton(color: Color(0xFFF0ECE5)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient( //Mengatur agar background aplikasi memiliki gradasi
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF0ECE5),
              Color(0xFFB6BBC4),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Waktu tersisa: $_timeInSeconds detik. Nilai anda: $_score',
                    style: TextStyle(fontSize: 18, color: Color(0xFF31304D)),
                  ),
                ),
                Quiz(
                  questionIndex: _questionIndex,
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Daftar pertanyaan, setiap pertanyaan dengan gambar dan jawaban-jawabannya
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Syntax Bahasa Pemrograman apakah ini?',
      'questionImage': 'assets/c++.jpeg',
      'answers': [
        {'text': 'Java', 'score': 0},
        {'text': 'C++', 'score': 20},
        {'text': 'TypeScript', 'score': 0},
        {'text': 'C', 'score': 0},
        {'text': 'Assembly', 'score': 0},
      ],
    },
    {
      'questionText': 'Syntax Bahasa Pemrograman apakah ini?',
      'questionImage': 'assets/java.jpeg',
      'answers': [
        {'text': 'Dart', 'score': 0},
        {'text': 'Swift', 'score': 0},
        {'text': 'Java', 'score': 20},
        {'text': 'Kotlin', 'score': 0},
        {'text': 'JavaScript', 'score': 0},
      ],
    },
    {
      'questionText': 'Syntax Bahasa Pemrograman apakah ini?',
      'questionImage': 'assets/php.jpeg',
      'answers': [
        {'text': 'PHP', 'score': 20},
        {'text': 'Perl', 'score': 0},
        {'text': 'Ruby', 'score': 0},
        {'text': 'Go-Lang', 'score': 0},
        {'text': 'SQL', 'score': 0},
      ],
    },
    {
      'questionText': 'Syntax Bahasa Pemrograman apakah ini?',
      'questionImage': 'assets/python.jpeg',
      'answers': [
        {'text': 'Visual Basic', 'score': 0},
        {'text': 'XML', 'score': 0},
        {'text': 'C#', 'score': 0},
        {'text': 'Python', 'score': 20},
        {'text': 'Java', 'score': 0},
      ]
    },
    {
      'questionText': 'Syntax Bahasa Pemrograman apakah ini?',
      'questionImage': 'assets/c.jpeg',
      'answers': [
        {'text': 'C#', 'score': 20},
        {'text': 'Dart', 'score': 0},
        {'text': 'CSS', 'score': 0},
        {'text': 'Visual Basic', 'score': 0},
        {'text': 'Ruby', 'score': 0},
      ]
    }
  ];

  @override
  void initState() {
    super.initState();
    _startTimer(); // Mulai timer ketika widget diinisialisasi
  }

  @override
  void dispose() {
    _timer?.cancel(); // Hentikan timer ketika widget dihapus
    super.dispose();
  }

  // Logika timer untuk menghitung mundur waktu untuk setiap pertanyaan
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeInSeconds > 0) {
          _timeInSeconds--;
        } else {
          _nextQuestion();
        }
      });
    });
  }

  // Pindah ke pertanyaan berikutnya atau menampilkan hasil jika semua pertanyaan telah dijawab
  void _nextQuestion() {
    _timer?.cancel();
    _timeInSeconds = 10;
    if (_questionIndex < _questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
      _startTimer();
    } else {
      _showResult();
    }
  }

  // Beralih ke layar hasil
  void _showResult() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Result(_score, _resetQuiz),
      ),
    );
  }

  // Perbarui skor dan pindah ke pertanyaan berikutnya
  void _answerQuestion(int score) {
    _score += score;
    _nextQuestion();
  }

  // Atur ulang kuis untuk memulai dari awal
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
    _startTimer();
  }
}