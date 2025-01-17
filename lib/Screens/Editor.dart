import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors/colors.dart';
import 'package:noteapp/Screens/widgets/editor_body.dart';
import 'package:noteapp/Screens/widgets/editor_header.dart';

class Editor extends StatelessWidget {
  Editor({super.key});
  TextEditingController contentController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 20,
            children: [
              EditorHeader(
                contentController: contentController,
                titleController: titleController,
              ),
              EditorBody(
                subjectController: contentController,
                titleController: titleController,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
