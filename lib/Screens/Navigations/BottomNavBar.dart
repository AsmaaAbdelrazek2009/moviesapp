import 'package:flutter/material.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';

import '../../API Manager/APIManager.dart';
import '../../Models/MoviesList/MoviesList.dart';
import '../../Utilites/AppColors.dart';
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



  @override
  void initState() {
    super.initState();
    _loadData();
  }
  List<Movie> getMovies = [];

  void _loadData() async {
    try {
      var data = await Apimanager.getMovies();
      setState(() {
        getMovies = data;
      });
    } catch (e) {
      print("Error loading movies: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages=[HomePage(),SearchPage( allmovies: getMovies,),ProfilePage(),ExplorePage(),];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: pages[SelectedIndex],
      bottomNavigationBar: buildBottomNavBar(),

    );
  }

 Widget buildBottomNavBar() {
    return Container(
      // height: 75,
      margin: EdgeInsets.all(14),
      child: ClipRRect(

        borderRadius: BorderRadiusGeometry.circular(16),
        child: BottomNavigationBar(

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
            iconSize: 25,
          showSelectedLabels: false,
          showUnselectedLabels: false,
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
        ],

        ),
      ),
    );
  }
}
