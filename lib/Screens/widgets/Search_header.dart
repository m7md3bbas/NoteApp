import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors/colors.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key, required this.controller, required this.onChanged});
  final TextEditingController controller;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: MyColors.iconBackGroundColor),
      child: TextFormField(
        cursorHeight: 20,
        controller: controller,
        style: TextStyle(color: MyColors.textColor, fontSize: 20),
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: MyColors.textColor),
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: MyColors.textColor,
            )),
        onChanged: onChanged, // Update the query on text change
      ),
    );
  }
}
