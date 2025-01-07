import 'package:flutter/material.dart';
import 'package:noteapp/Screens/edit_note_screen.dart';

class CustomNoteItem extends StatelessWidget {
  CustomNoteItem(
      {super.key,
      required this.title,
      required this.content,
      required this.id,
      required this.color,
      required this.date});
  final String title;
  final String content;
  final int id;
  final Color color;
  final String date;


  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        titleController.text = title;
        contentController.text = content;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditNoteScreen(
                      id: id,
                      contentController: contentController,
                      titleController: titleController,
                    )));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            title,
          ),
          subtitle: Text(date),
        ),
      ),
    );
  }
}
