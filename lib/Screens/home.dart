import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors/colors.dart';
import 'package:noteapp/Screens/widgets/button_to_add_note.dart';
import 'package:noteapp/Screens/widgets/home_body.dart';
import 'package:noteapp/Screens/widgets/home_header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              HomeHeader(),
              SizedBox(height: 20),
              Expanded(child: HomeBody()),
            ],
          ),
        ),
      ),
      floatingActionButton: ButtonToAddNote(),
    );
  }
}
