import 'package:flutter/material.dart';

import '../../core/app_color.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key, required this.hintText,});
  final String hintText;
  //final Color color;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColor.textWhite),
      cursorColor: AppColor.textWhite,
      decoration: InputDecoration(
          hint: Text('Search',
            style:TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.iconHint) ,),
          filled: true,
          fillColor: AppColor.textField,
          suffixIcon: Transform.rotate(
            angle: 1.75,
            child: Icon(Icons.search, color: AppColor.iconHint),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          )
      ),
    );
  }
}
