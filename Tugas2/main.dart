import 'package:flutter/material.dart';

void main() {
  runApp(ProfileCard());
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/profile1': (context) => ProfilePage(
          name: 'Miftakh Damar Faizin',
          role: 'Front End Developer',
          phoneNumber: '081513216831',
          email: 'miftakhdamar.22013@mhs.unesa.ac.id',
          imagePath: 'image/damar.jpg',
          deks: 'Front End Developer adalah ahli dalam membangun antarmuka pengguna (UI) untuk aplikasi web dan mobile. Tugasnya meliputi desain, pengembangan, dan pengoptimalan antarmuka pengguna agar mudah digunakan dan menarik.',
        ),
        '/profile2': (context) => ProfilePage(
          name: 'Enrique Rendhi Julian Mahardhika',
          role: 'Back End Developer',
          phoneNumber: '0885883332',
          email: 'enrique.22031@mhs.unesa.ac.id',
          imagePath: 'image/enriq.jpg',
          deks: ('Back End Developer adalah profesional dalam pengembangan bagian "belakang" dari sebuah aplikasi web atau aplikasi mobile. Tugas utamanya adalah membangun dan mengelola server, database, dan logika aplikasi yang berjalan di sisi server.'),
        ),
        '/profile3': (context) => ProfilePage(
          name: 'Aryangga Putra Satrya',
          role: 'Mobile Developer',
          phoneNumber: '089612010482',
          email: 'aryangga.22033@mhs.unesa.ac.id',
          imagePath: 'image/angga.jpg',
          deks: ('Mobile Developer adalah seorang profesional yang mengkhususkan diri dalam pengembangan aplikasi untuk platform mobile, seperti iOS (Swift atau Objective-C) dan Android (Kotlin atau Java) dan bisa menggunakan flutter untuk keduanya.'),
        ),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Kelompok 11 SOLID SOLID SOLID',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile1');
                },
                child: buildProfileContainer('image/damar.jpg', 'Miftakh Damar Faizin'),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile2');
                },
                child: buildProfileContainer('image/enriq.jpg', 'Enrique Rendhi Julian Mahardhika'),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile3');
                },
                child: buildProfileContainer('image/angga.jpg', 'Aryangga Putra Satrya'),
              ),
              SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileContainer(String imagePath, String name) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        SizedBox(height: 5),
        Text(
          name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String name;
  final String role;
  final String phoneNumber;
  final String email;
  final String imagePath;
  final String deks;

  const ProfilePage({
    required this.name,
    required this.role,
    required this.phoneNumber,
    required this.email,
    required this.imagePath,
    required this.deks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(imagePath),
              ),
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'MadimiOne'),
              ),
              Text(
                role,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                phoneNumber,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                email,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                deks,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}