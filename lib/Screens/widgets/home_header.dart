import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors.dart';
import 'package:noteapp/Screens/widgets/custom_icon_button_widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Notes",
          style: TextStyle(
              fontSize: 43,
              color: MyColors.textColor,
              fontWeight: FontWeight.w600),
        ),
        Spacer(),
        CustomIconButtonWidget(
          icon: Icons.search,
          onPressed: () {},
        ),
        SizedBox(width: 20),
        CustomIconButtonWidget(
          icon: Icons.info,
          onPressed: () {},
        )
      ],
    );
  }
}