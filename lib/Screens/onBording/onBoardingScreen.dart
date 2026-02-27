import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';
import '../../AppConstants/AppConstants.dart';
import '../../Utilites/AppColors.dart';
import '../../Widgets/Button.dart';
import '../Signup/SignupScreen.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    var onBordingData= AppConstants.onBordinList;
    PageController pageController=PageController();

    return Scaffold(
      backgroundColor: AppColors.black,
      body: PageView.builder(
        controller: pageController,

          itemCount: onBordingData.length,
          itemBuilder: (context, index){
        return Stack(
         children: [
           Image.asset(onBordingData[index].imgPath, fit: BoxFit.cover,),
      Gredian(context),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 16.0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                Center(child: Text(onBordingData[index].Header,style: AppTextStyles.whiteHeader500mediam36,)),
                 Text(onBordingData[index].SubTitle,style: AppTextStyles.whitesubHeader400mediam20),

                 // AppButton(text: "Explore now",color: AppColors.yellow, onPressed: (){},),
                 if (index == 0) ...[
                   AppButton(text: "Explore Now", color1: AppColors.yellow,color2: AppColors.yellow,  TextColor:AppColors.black,onPressed: () {
                                  pageController.animateToPage(1, duration: Duration(milliseconds: 6), curve: Curves.easeInOut);
                   }),
                 ]
                 else if (index == onBordingData.length - 1) ...[
                   AppButton(text: "Finish", color1: AppColors.yellow, color2: AppColors.yellow,  TextColor:AppColors.black,onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));

                   }),
                   const SizedBox(height: 12),
                 ]
                 else ...[
                     AppButton(text: "Next", color1: AppColors.yellow,color2: AppColors.yellow, TextColor:AppColors.black, onPressed: () {
                       pageController.animateToPage((pageController.page??0).round() + 1, duration: Duration(milliseconds: 6), curve: Curves.easeInOut);

                     }),
                     const SizedBox(height: 12),
                     AppButton(text: "Back", color1: AppColors.black,color2: AppColors.yellow,TextColor:AppColors.yellow , onPressed: () {
                       pageController.animateToPage((pageController.page??0).round() -1, duration: Duration(milliseconds: 6), curve: Curves.easeInOut);
                     }),
                   ],
               ],
             ),
           ),
          ],
        );
      }),
    );
  }

  Align Gredian(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter ,
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter ,
            end: Alignment.bottomCenter,
            colors:[
              AppColors.black.withOpacity(0.2),
              Colors.black.withOpacity(0.9),
            ]
          )
        ),
      ),
    );
  }
}
