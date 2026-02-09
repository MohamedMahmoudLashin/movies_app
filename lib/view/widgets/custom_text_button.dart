import 'package:flutter/material.dart';
import 'package:movies/core/app_color.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed:onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColor.textWhite,
        ),
      ),
    );
  }
}
