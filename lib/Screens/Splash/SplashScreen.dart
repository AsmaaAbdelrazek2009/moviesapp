import 'package:flutter/material.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';

import '../../Utilites/AppColors.dart';
import '../onBording/onBoardingScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  
  @override
  void initState() {
    
    Future.delayed(Duration(seconds: 4),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>onBoarding()));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: AppColors.black,
      body: Center(child:

        Image.asset(AppAssets.logo),
        ),
    );
  }
}
