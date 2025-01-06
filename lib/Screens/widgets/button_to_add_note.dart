
import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors.dart';

class ButtonToAddNote extends StatelessWidget {
  const ButtonToAddNote({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: MyColors.primaryColor,
        onPressed: onPressed,
        child: Icon(
          Icons.add,
          color: MyColors.textColor,
          size: 48,
        ),
      ),
    );
  }
}
