import 'package:flutter/material.dart';
import 'package:noteapp/Core/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          HomeHeader(),
        ],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
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
      ),
    );
  }
}

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
