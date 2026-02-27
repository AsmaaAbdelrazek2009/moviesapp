import 'package:flutter/material.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppColors.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';

import '../Models/AppConstans/AppConstans.dart';

class Cards extends StatelessWidget {
   Cards({super.key, required this.availableNow});

  final AvailableNow availableNow;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 234,
      height: 351,
      decoration: BoxDecoration(
       image: DecorationImage(image: AssetImage(availableNow.imgPath),fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(20),
      ),
      child:
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            decoration: BoxDecoration(
              color: AppColors.Grey.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(10),

            ),
            child:
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(availableNow.rate,style: AppTextStyles.whitesubHeader400mediam16,),
                    SizedBox(width: 4,),
                    Icon(Icons.star,color: AppColors.yellow,size: 20,)
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
