import 'package:flutter/material.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';

import '../Utilites/AppColors.dart';

class AppButton extends StatelessWidget {

  final onPressed;
  final String text;
  final Color color1;
  final Color color2;
  final Color TextColor;

  const AppButton({super.key,  required this.onPressed, required this.text, required this.color1,  required this.color2,required this.TextColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(onPressed: onPressed,
        child: Text(text,style: TextColor==AppColors.yellow? AppTextStyles.yellowText600mediam20: AppTextStyles.blackText600mediam20,),
      style: ElevatedButton.styleFrom(
        backgroundColor: color1 ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side:BorderSide(color: color2),
        ),
        minimumSize: const Size(double.infinity,55)
      ),



      ),
    );
  }
}
