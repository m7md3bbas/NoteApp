import 'package:flutter/material.dart';
import 'package:noteapp/Data/sqflite.dart';
import 'package:noteapp/Screens/home.dart';
import 'package:noteapp/Screens/widgets/custom_icon_button_widget.dart';

class NoteEditHeader extends StatelessWidget {
  NoteEditHeader(
      {super.key,
      required this.contentController,
      required this.titleController,
      required this.id});

  final TextEditingController contentController;
  final TextEditingController titleController;
  final int id;

  Sqflite sqflite = Sqflite.getInstance();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButtonWidget(
          icon: Icons.arrow_back_ios,
          onPressed: () {
            // Return to previous screen
            Navigator.pop(context, true);
          },
        ),
        Spacer(),
        CustomIconButtonWidget(
          icon: Icons.remove_red_eye_outlined,
          onPressed: () {
            // Placeholder for preview functionality (if needed)
          },
        ),
        SizedBox(width: 20),
        CustomIconButtonWidget(
          icon: Icons.save,
          onPressed: () async {
            String title = titleController.text.trim();
            String content = contentController.text.trim();

            // Check if the title or content is empty
            if (title.isEmpty || content.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    title.isEmpty
                        ? 'Title cannot be empty!'
                        : 'Content cannot be empty!',
                  ),
                ),
              );
              return;
            }

            // Update the note in the database
            await sqflite.updatedata(content: content, title: title, id: id);

            // Navigate back to the Home screen after saving the note
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
        ),
      ],
    );
  }
}
