import 'package:flutter/material.dart';
import 'package:movies/core/app_color.dart';
import 'package:movies/view/screens/watch_screen.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';

class CustomNavigatorBar extends StatefulWidget {
  const CustomNavigatorBar({super.key});

  @override
  State<CustomNavigatorBar> createState() => _CustomNavigatorBarState();
}

class _CustomNavigatorBarState extends State<CustomNavigatorBar> {

  List<Widget>screens= [
    HomeScreen(),
    SearchScreen(),
    WatchScreen()
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColor.blue, width: 2)),
      ),
      child: NavigationBar(
        elevation: 20,
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((
          Set<MaterialState> states,
        ) {
          if (states.contains(MaterialState.selected)) {
            return TextStyle(color: AppColor.blue, fontSize: 12);
          }
          return TextStyle(
            color: AppColor.iconHint,
            fontSize: 12,
          ); // unselected
        }),
        shadowColor: Colors.blue,
        onDestinationSelected: (int index) {
          setState(() {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context)=>screens.elementAt(index))
            );
            _selectedIndex = index;
          });
        },
        backgroundColor: AppColor.backGround,
        selectedIndex: _selectedIndex,
        indicatorColor: AppColor.backGround,
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? AppColor.blue : AppColor.iconHint,
              size: 35,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.search,
              color: _selectedIndex == 1 ? AppColor.blue : AppColor.iconHint,
              size: 35,
            ),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.favorite_outline_outlined,
              color: _selectedIndex == 2 ? AppColor.blue : AppColor.iconHint,
              size: 35,
            ),
            label: 'Watch list',
            selectedIcon: Icon(
              Icons.favorite,
              size: 35,
              color: _selectedIndex == 2 ? AppColor.blue : AppColor.iconHint,
            ),
          ),
        ],
      ),
    );
  }
}
