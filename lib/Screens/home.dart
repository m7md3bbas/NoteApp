import 'package:flutter/material.dart';
import 'package:noteapp/Screens/widgets/home_body.dart';
import 'package:noteapp/Screens/widgets/home_header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [HomeHeader(), Spacer(), HomeBody(), Spacer()],
        ),
      ),
    );
  }
}
