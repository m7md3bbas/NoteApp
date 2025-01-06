import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors.dart';
import 'package:noteapp/Screens/widgets/Search_header.dart';
import 'package:noteapp/Screens/widgets/custom_note_item.dart';
import 'package:noteapp/Screens/widgets/search_body.dart';

class Search extends StatelessWidget {
  const Search({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SearchHeader(),
            Text("Result", style: TextStyle(color: MyColors.textColor)),
            SearchBody(),
          ],
        ),
      )),
    );
  }
}
