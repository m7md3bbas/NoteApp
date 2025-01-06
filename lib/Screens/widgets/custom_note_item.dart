import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 157,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: MyColors.backgroundColorItem,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "Hello, my name is mohamed emad abbas im a flutter software enginner",
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
      ),
    );
  }
}
