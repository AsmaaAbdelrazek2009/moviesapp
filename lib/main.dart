import 'package:flutter/material.dart';
import 'Screens/EditProfile/EditProfile.dart';
import 'Screens/FilmDetails/FileDetails.dart';
import 'Screens/LoginTypes/Login/LoginScreen.dart';
import 'Screens/LoginTypes/Signup/SignupScreen.dart';
import 'Screens/LoginTypes/forgetPassword/ForgetPassword.dart';
import 'Screens/Navigations/BottomNavBar.dart';
import 'Screens/Navigations/ExplorePage/ExplorePage.dart';
import 'Screens/Navigations/HomePage/HomePage.dart';
import 'Screens/Navigations/SearchPage/SearchPage.dart';
import 'Screens/Splash/SplashScreen.dart';
import 'Screens/onBording/onBoardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:FirebaseOptions(apiKey: "AIzaSyAaH5F13jPjiJBDdSoW2m4sVjBDhaJOnQo", appId: "1:768018220316:android:00d5b5ae507ad6574526d9",
          messagingSenderId: "", projectId:  "movies-project-d627f")
  );

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home:LoginScreen(),
    );
  }
}
