import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/app_color.dart';
import 'package:movies/view/widgets/Custom_app_bar.dart';
import 'package:movies/view/widgets/text_details.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  double rating = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: CustomAppBar(
          title: "Watch list", angle: 0, toolTipMessage: ""),
      body: Center(child: Column(
              children: [
              ],
            )),
      bottomNavigationBar:ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              color: AppColor.textWhite.withOpacity(.2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Rate This Movie",style: TextStyle(color: AppColor.textWhite,fontSize: 18,letterSpacing: .75,fontWeight: FontWeight.w400),),
                Text(rating.toStringAsFixed(1),style: TextStyle(color: AppColor.textWhite,fontSize: 32,letterSpacing: .75,fontWeight: FontWeight.w400)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Slider(
                      overlayColor: WidgetStatePropertyAll(AppColor.textField),
                      allowedInteraction: SliderInteraction.tapAndSlide,
                      activeColor: AppColor.yellowStar,
                      value: rating,
                      max: 10,
                      min: 0,
                      label: rating.toString(),
                      onChanged: (value){
                        setState(() {
                          rating=value;
                        });
                      }),
                ),
                ElevatedButton(
                    style:ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(AppColor.blue),
                        fixedSize: WidgetStateProperty.all(Size.fromWidth(200))) ,
                    onPressed: (){},
                    child: TextDetails(title: "OK"))
              ],
            ),
          ),
        ),
      ),

    );
  }
}
