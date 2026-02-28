import 'package:flutter/material.dart';

import 'Screens/FilmDetails/FileDetails.dart';
import 'Screens/Login/LoginScreen.dart';
import 'Screens/Navigations/BottomNavBar.dart';
import 'Screens/Navigations/HomePage/HomePage.dart';
import 'Screens/Signup/SignupScreen.dart';
import 'Screens/Splash/SplashScreen.dart';
import 'Screens/onBording/onBoardingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home:BottomNavBar(),
    );
  }
}
