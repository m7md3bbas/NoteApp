import 'package:flutter/material.dart';
import 'package:noteapp/Data/sqflite.dart';
import 'package:noteapp/Screens/home.dart';
import 'package:noteapp/Screens/widgets/custom_icon_button_widget.dart';

class EditorHeader extends StatelessWidget {
  EditorHeader({
    super.key,
    required this.titleController,
    required this.contentController,
  });

  final TextEditingController titleController;
  final TextEditingController contentController;
  final Sqflite sqflite = Sqflite.getInstance();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButtonWidget(
          icon: Icons.arrow_back_ios,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Spacer(),
        CustomIconButtonWidget(
          icon: Icons.remove_red_eye_outlined,
          onPressed: () {
            // Placeholder for preview functionality
          },
        ),
        SizedBox(width: 20),
        CustomIconButtonWidget(
          icon: Icons.save,
          onPressed: () async {
            String title = titleController.text.trim();
            String content = contentController.text.trim();

            if (title.isEmpty || content.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Title and content cannot be empty!'),
                ),
              );
              return;
            }

            await sqflite.insertdata(content: content, title: title);

            // Navigate to Home after saving
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
