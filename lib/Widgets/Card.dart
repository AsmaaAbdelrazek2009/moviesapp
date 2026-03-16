import 'package:flutter/material.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppColors.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';

import '../Models/AppConstans/AppConstans.dart';
import '../Models/MoviesList/MoviesList.dart';

class Cards extends StatelessWidget {
   Cards({super.key,required,required this.movie,required this.heigh, required  this.width });

    final double heigh;
    final double width;
   final Movie movie;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigh,
      decoration: BoxDecoration(
       image: DecorationImage(image: NetworkImage(movie.mediumCoverImage??"",headers: {
       'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
       'Referer': 'https://yts.bz/',
       },),fit: BoxFit.cover),
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
                    Text(movie.rating.toString(),style: AppTextStyles.whitesubHeader400mediam16,),
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
