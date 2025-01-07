import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors/colors.dart';
import 'package:noteapp/Screens/editor.dart';

class ButtonToAddNote extends StatelessWidget {
  const ButtonToAddNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: MyColors.primaryColor,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  Editor()));
        },
        child: Icon(
          Icons.add,
          color: MyColors.textColor,
          size: 48,
        ),
      ),
    );
  }
}
