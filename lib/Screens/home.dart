import 'package:flutter/material.dart';
import 'package:noteapp/core/constant.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [HomeHeader()],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, this.ontap});
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Text(
            "Notes",
            style: TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.w600,
              color: styles.primarycolor,
            ),
          ),
          Spacer(),
          CustomIconWidget(
            ontap: ontap,
            icon: Icons.search,
          ),
          SizedBox(
            width: 20,
          ),
          CustomIconWidget(
            ontap: ontap,
            icon: Icons.info,
          ),
        ],
      ),
    );
  }
}

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({
    super.key,
    required this.ontap,
    required this.icon,
  });

  final void Function()? ontap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xff3B3B3B)),
      child: IconButton(
          onPressed: ontap,
          icon: Icon(
            color: styles.primarycolor,
            icon,
            size: 24,
          )),
    );
  }
}
