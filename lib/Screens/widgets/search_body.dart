import 'package:flutter/material.dart';
import 'package:noteapp/Screens/widgets/custom_note_item.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return CustomNoteItem(
            date: "mohamed",
            color: Colors.red,
            id: 5,
            title: "mohamed",
            content: "mohamed",
          );
        },
      ),
    );
  }
}
