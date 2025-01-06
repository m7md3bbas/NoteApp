
import 'package:flutter/material.dart';
import 'package:noteapp/Screens/widgets/custom_icon_button_widget.dart';

class EditorHeader extends StatelessWidget {
  const EditorHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButtonWidget(
            icon: Icons.arrow_back_ios,
            onPressed: () {
              Navigator.pop(context);
            }),
        Spacer(),
        CustomIconButtonWidget(
            icon: Icons.remove_red_eye_outlined, onPressed: () {}),
        SizedBox(width: 20),
        CustomIconButtonWidget(icon: Icons.save, onPressed: () {})
      ],
    );
  }
}