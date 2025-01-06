
import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/Images/rafiki.png"),
        SizedBox(
          height: 10,
        ),
        Text(
          "Create your first note !",
          style: TextStyle(
              color: MyColors.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w200),
        )
      ],
    );
  }
}
