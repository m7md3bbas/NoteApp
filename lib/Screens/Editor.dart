import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors.dart';
import 'package:noteapp/Screens/widgets/editor_body.dart';
import 'package:noteapp/Screens/widgets/editor_header.dart';

class Editor extends StatelessWidget {
  const Editor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              EditorHeader(),
              SizedBox(height: 20),
              EditorBody(),
            ],
          ),
        ),
      )),
    );
  }
}
