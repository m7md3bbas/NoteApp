import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors.dart';
import 'package:noteapp/Screens/widgets/editor_header.dart';

class Editor extends StatelessWidget {
  const Editor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(child: EditorHeader()),
            SizedBox(height: 20),
            Expanded(child: EditorBody()),
            Spacer()
          ],
        ),
      )),
    );
  }
}

class EditorBody extends StatelessWidget {
  EditorBody({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
              hintText: "Title",
              hintStyle: TextStyle(fontSize: 48, color: MyColors.textNoteColor),
              border: InputBorder.none),
          cursorHeight: 52,
          controller: titleController,
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: TextFormField(
            expands: true,
            decoration: InputDecoration(
                hintText: "Type something...",
                border: InputBorder.none,
                constraints: BoxConstraints.expand(),
                hintStyle: TextStyle(
                  color: MyColors.textNoteColor,
                  fontSize: 23,
                )),
            cursorHeight: 35,
            controller: subjectController,
          ),
        ),
      ],
    );
  }
}
