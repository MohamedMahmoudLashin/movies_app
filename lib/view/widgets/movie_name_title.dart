import 'package:flutter/material.dart';
import 'package:movies/core/app_color.dart';

class MovieNameTitle extends StatelessWidget {
  const MovieNameTitle({super.key,required this.movieName, required this.movieYear, required this.movieTime, required this.movieType});

  final String movieName;
  final int movieYear;
  final String  movieTime;
  final String movieType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:15,bottom: 20),
      child: Column(
        children: [
          Text(movieName,style: TextStyle(fontSize: 18,fontWeight:FontWeight.w600 ,color: AppColor.textWhite),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_today_sharp,color: AppColor.iconHint,),
              Text("$movieYear",style: TextStyle(fontSize: 12,fontWeight:FontWeight.w500 ,color: AppColor.iconHint,letterSpacing: 0.12)),
              SizedBox(
                  height: 20,
                  width: 30,
                  child: VerticalDivider(color: AppColor.iconHint,thickness: 2,)),
              Icon(Icons.watch_later_outlined,color: AppColor.iconHint,),
              Text("$movieTime minutes",style: TextStyle(fontSize: 12,fontWeight:FontWeight.w500 ,color: AppColor.iconHint,letterSpacing: 0.12)),
              SizedBox(
                  height: 20,
                  width: 40,
                  child: VerticalDivider(color: AppColor.iconHint,thickness: 2,)),
              Icon(Icons.save,color: AppColor.iconHint,),
              Text(movieType,style: TextStyle(fontSize: 12,fontWeight:FontWeight.w500 ,color: AppColor.iconHint,letterSpacing: 0.12)),
            ],
          )
        ],
      ),
    );
  }
}
