import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors.dart';
import 'package:noteapp/Screens/home.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Home(),
      ),
    );
  }
}
