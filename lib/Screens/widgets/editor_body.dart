import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors.dart';

class EditorBody extends StatelessWidget {
  EditorBody({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.18,
          child: TextFormField(
            expands: true,
            maxLines: null,
            minLines: null,
            decoration: InputDecoration(
                hintText: "Title",
                hintStyle:
                    TextStyle(fontSize: 48, color: MyColors.textNoteColor),
                border: InputBorder.none),
            cursorHeight: 52,
            style: TextStyle(fontSize: 35, color: MyColors.textColor),
            controller: titleController,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: TextFormField(
            expands: true,
            maxLines: null,
            minLines: null,
            decoration: InputDecoration(
              hintText: "Type something...",
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: MyColors.textNoteColor,
                fontSize: 23,
              ),
            ),
            style: TextStyle(fontSize: 23, color: MyColors.textColor),
            cursorHeight: 35,
            controller: subjectController,
          ),
        ),
      ],
    );
  }
}
