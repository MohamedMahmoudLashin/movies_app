import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movies/core/app_color.dart';
import 'package:movies/view/screens/home_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title,required this.sufIcon});

  final String title;
  final Icon sufIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.backGround,
      centerTitle: true,
      titleSpacing: 0,
      leadingWidth: 90,
      leading: IconButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        icon: Icon(Icons.arrow_back_ios, color: AppColor.appBarColor),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.appBarColor,
        ),
      ),
      actions: [
        SizedBox(
          width: 90,
          child: Tooltip(
            message: 'Search about what do you want',
            child: Transform.rotate(
              angle: 3.1,
              child:sufIcon
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
