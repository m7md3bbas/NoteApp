import 'package:flutter/material.dart';
import 'package:noteapp/Screens/home.dart';
import 'package:noteapp/core/constant.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: styles.backgroundColor,
        body: const Home(),
      ),
    );
  }
}
