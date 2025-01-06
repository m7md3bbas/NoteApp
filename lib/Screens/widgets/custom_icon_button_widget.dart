import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors.dart';

class CustomIconButtonWidget extends StatelessWidget {
  const CustomIconButtonWidget({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.iconBackGroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: MyColors.textColor,
          )),
    );
  }
}
