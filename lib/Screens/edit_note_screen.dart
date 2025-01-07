import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors/colors.dart';
import 'package:noteapp/Screens/widgets/edit_note_screen.dart';
import 'package:noteapp/Screens/widgets/editor_body.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen(
      {super.key,
      required this.contentController,
      required this.titleController,
      required this.id});
  final TextEditingController contentController;
  final TextEditingController titleController;
  final int id;
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
              NoteEditHeader(
                  contentController: contentController,
                  titleController: titleController,
                  id: id),
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
