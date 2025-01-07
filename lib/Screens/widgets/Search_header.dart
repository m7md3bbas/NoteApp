
import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors/colors.dart';

class SearchHeader extends StatelessWidget {
  SearchHeader({super.key});
  TextEditingController controller = TextEditingController();
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
      ),
    );
  }
}
