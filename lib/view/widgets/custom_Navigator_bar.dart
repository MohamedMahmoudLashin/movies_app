import 'package:flutter/material.dart';
import 'package:movies/core/app_color.dart';

class CustomNavigatorBar extends StatefulWidget {
  const CustomNavigatorBar({super.key});

  @override
  State<CustomNavigatorBar> createState() => _CustomNavigatorBarState();
}

class _CustomNavigatorBarState extends State<CustomNavigatorBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      backgroundColor: AppColor.backGround,
      selectedIndex: _selectedIndex,
      indicatorColor: AppColor.backGround,
      destinations: [
        NavigationDestination(icon: Icon(Icons.home,color: AppColor.iconHint, size: 35), label: 'Home'),
        NavigationDestination(
          icon: Icon(Icons.search,color: AppColor.iconHint, size: 35),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline_outlined,color: AppColor.iconHint, size: 35),
          label: 'Watch list' ,selectedIcon:Icon(Icons.favorite,size: 35,) ,
        ),
      ],
    );
  }
}
