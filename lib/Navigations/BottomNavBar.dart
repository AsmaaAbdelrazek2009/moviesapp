import 'package:flutter/material.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';

import '../Utilites/AppColors.dart';
import 'ExplorePage/ExplorePage.dart';
import 'HomePage/HomePage.dart';
import 'ProfilePage/ProfilePage.dart';
import 'SearchPage/SearchPage.dart';

class BottomNavBar extends StatefulWidget {
   BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var SelectedIndex=0;

  var pages=[HomePage(),SearchPage(),ProfilePage(),ExplorePage(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: pages[SelectedIndex],
      bottomNavigationBar: buildBottomNavBar(),

    );
  }

 Widget buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
        currentIndex: SelectedIndex,
        onTap: (newIndex){
        setState(() {
          SelectedIndex=newIndex;

        });
        },
        backgroundColor: AppColors.Grey,
        selectedItemColor: AppColors.yellow,
        unselectedItemColor: AppColors.white,
        iconSize: 28,
        items:
    [
      BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
        label: "",

      ),

      BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
        label: "",

      ),

      BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
        label: "",

      ),

      BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
        label: "",

      ),
    ]);
  }
}
