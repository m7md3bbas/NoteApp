import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors/colors.dart';
import 'package:noteapp/Core/widgets/custom_fading.dart';

class CustomLoadingItems extends StatelessWidget {
  const CustomLoadingItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => CustomFadingWidget(
                child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: MyColors.getRandomColor(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Container(
                  width: 10,
                  height: 5,
                  decoration: BoxDecoration(
                    color: MyColors.textColor,
                  ),
                ),
                subtitle: Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: MyColors.textColor,
                  ),
                ),
              ),
            )));
  }
}
