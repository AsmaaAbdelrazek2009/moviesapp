import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'AppColors.dart';

abstract final class AppTextStyles{

  static const TextStyle whiteHeader500mediam36=TextStyle(fontSize: 36, fontWeight: FontWeight.w500, color: AppColors.white);
  static const TextStyle whiteHeader700mediam24=TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.white);
  static const TextStyle whiteHeader700mediam20=TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.white);
  static const TextStyle whitesubHeader400mediam20=TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.white);
  static const TextStyle whitesubHeader400mediam14=TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.white);

  static const TextStyle whitesubHeader400mediam16=TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.white);


  static const TextStyle greySubHeader400mediam20=TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.Grey);



  static const TextStyle blackText600mediam20=TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black);


  static const TextStyle yellowText600mediam20=TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.yellow);
  static const TextStyle yellowText400mediam14=TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.yellow);
  static const TextStyle yellowText400mediam16=TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.yellow);
  static const TextStyle yellowText900mediam14=TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: AppColors.yellow);



}