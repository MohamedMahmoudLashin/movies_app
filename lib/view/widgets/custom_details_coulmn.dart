import 'package:flutter/material.dart';
import 'package:movies/core/app_color.dart';

class CustomDetailsCoulmn extends StatelessWidget {
  const CustomDetailsCoulmn({super.key, required this.movieName, required this.movieRate, required this.movieType, required this.movieYear, required this.movieTime});
  
  final String movieName;
  final double movieRate;
  final String movieType;
  final int movieYear;
  final String movieTime;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(movieName,maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 16 ,fontWeight:FontWeight.w600 ,color: AppColor.textWhite ),),
          SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Icon(Icons.star_border_purple500_outlined,color: AppColor.yellowStar,size: 20,),
            SizedBox(width: 4,),
            Text(movieRate.toString(),style: TextStyle(fontSize: 12 ,fontWeight:FontWeight.w400 ,color: AppColor.textWhite ),),
          ],),
          Row(children: [
            Icon(Icons.call_to_action_outlined,color: AppColor.textWhite,size: 15,),
            SizedBox(width: 8,),
            Text(movieType.toString(),style: TextStyle(fontSize: 12 ,fontWeight:FontWeight.w400 ,color: AppColor.textWhite ),),
          ],),
          Row(children: [
            Icon(Icons.calendar_today_outlined,color: AppColor.textWhite,size: 15,),
            SizedBox(width: 8,),
            Text('$movieYear',style: TextStyle(fontSize: 12 ,fontWeight:FontWeight.w400 ,color: AppColor.textWhite ),),
          ],),
          Row(children: [
            Icon(Icons.watch_later_outlined,color: AppColor.textWhite,size: 15,),
            SizedBox(width: 8,),
            Text('$movieRate minutes',style: TextStyle(fontSize: 12 ,fontWeight:FontWeight.w400 ,color: AppColor.textWhite ),),
          ],)
        ],
      ),
    );
  }
}
