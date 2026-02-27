import 'package:flutter/material.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';

import '../../Utilites/AppColors.dart';
import '../../Widgets/Button.dart';
import '../../Widgets/Card.dart';

class FilmDetails extends StatelessWidget {
  const FilmDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(AppAssets.onBoarding3),
                Container(
                  height: MediaQuery.of(context).size.height*0.8,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter ,
                          end: Alignment.bottomCenter,
                          colors:[
                            AppColors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.99),
                          ]
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 330.0),
                  child: Column(
                    children: [
                      Center(child: Image.asset(AppAssets.Play,width: 70,)),
                      SizedBox(height:250,),
                      Center(child: Text("Film name",style: AppTextStyles.whiteHeader700mediam24,)),
                      SizedBox(height:25,),
                      Text("2022",style: AppTextStyles.greySubHeader400mediam20,)
                    ],
                  ),
                )

              ],
            ),
            AppButton(text: "Watch",onPressed: (){},color1: AppColors.red, color2: AppColors.red, TextColor: AppColors.white,),
            SizedBox(height: 10,),
              Row(
                children: [
                  buildFavTimeStarContainer("13", Icons.favorite ),
                  Spacer(),
                  buildFavTimeStarContainer("13", Icons.timelapse ),
                  Spacer(),
                  buildFavTimeStarContainer("13", Icons.star),
                ],
              ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ScreenShots",style: AppTextStyles.whiteHeader700mediam24,),
                    buildListView(),
                  SizedBox(height: 10,),
                  Text("Similar ",style: AppTextStyles.whiteHeader700mediam24,),

                  Widget buildGridView(),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget buildListView() {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 16,),
        shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context,index){
                    return Container(
                      height: 167,
                      width: 398,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(AppAssets.onBoarding4, fit: BoxFit.cover,),
                    );
                  });
  }

  Container buildFavTimeStarContainer(String Text1, IconData icon1) {
    return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.Grey,
                    borderRadius: BorderRadius.circular(15),

                  ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
                   child: Row(
                      children: [
                        Icon(icon1,size: 30,color: AppColors.yellow,),
                        SizedBox(width: 8,),
                        Text(Text1 ,style: AppTextStyles.whiteHeader700mediam24,),
                      ],
                    ),
                 )
                );
  }

  Widget buildGridView() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 0.7,
    ),
        itemCount: 4,
        itemBuilder: (context, index){
          return Cards( width: 189,heigh: 279,movie: null);

        });
  }
}
