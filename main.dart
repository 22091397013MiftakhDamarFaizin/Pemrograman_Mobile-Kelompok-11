import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('MyCat Apps', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Image(image: NetworkImage('https://static.wikia.nocookie.net/silly-cat/images/4/4d/Mr._Fresh.png/revision/latest?cb=20240117170647')),
        ),
      ),
    ),
  );
}