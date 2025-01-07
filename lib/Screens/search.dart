import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors/colors.dart';
import 'package:noteapp/Screens/widgets/Search_header.dart';
import 'package:noteapp/Screens/widgets/search_body.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchHeader(
                controller: controller,
                onChanged: (text) {
                  setState(() {
                    query = text;
                  });
                },
              ),
              SizedBox(height: 10),
              Text(
                "Result",
                style: TextStyle(color: MyColors.textColor),
              ),
              SizedBox(height: 10),
              SearchBody(query: query), // Pass query to SearchBody
            ],
          ),
        ),
      ),
    );
  }
}
