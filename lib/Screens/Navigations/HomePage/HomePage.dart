import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/Models/AppConstans/AppConstans.dart';
import 'package:moviesapp/Screens/Navigations/ExplorePage/ExplorePage.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';

import '../../../API Manager/APIManager.dart';
import '../../../Models/MoviesList/MoviesList.dart';
import '../../../Widgets/Card.dart';
import '../../FilmDetails/FileDetails.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  List <AvailableNow> availableNowList=AvailableNowList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: Apimanager.getMovies(), builder: (context,snapshot){

       if(snapshot.hasError)
         {
           return Text("Erorr");
         }
       else if (snapshot.hasData)
         {
           List <Movie> movies= snapshot.data!;
           List<Movie> sortedMovies = [...movies];
           List<Movie> normalMovies = [...movies];

           // List<Movie> horrorMovies = movies.where((m) => m.genres!.contains("Horror")).toList();
           sortedMovies.sort((a, b) {

             DateTime dateA = DateTime.parse(a.dateUploaded ?? "1900-01-01");
             DateTime dateB = DateTime.parse(b.dateUploaded ?? "1900-01-01");
             return dateB.compareTo(dateA);
           });
           return SingleChildScrollView(
             child: SafeArea(
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                     child: Text("Available Now",style: AppTextStyles.whiteHeader500mediam36,),
                   ),
                   buildAvailableNowList(context,sortedMovies),
                   SizedBox(height: 21,),
                   Text("Watch Now",style: AppTextStyles.whiteHeader500mediam36,),
               
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 12.0),
                     child: Row(
                       children: [
                         Text("Action",style: AppTextStyles.whitesubHeader400mediam20,),
                         Spacer(),
                         InkWell(
                             onTap: ()
                             {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>ExplorePage()));
                             },
                             child: Text("See more", style: AppTextStyles.yellowText400mediam16,)),
                       ],
                     ),
                   ),
                   buildWatchNowList(context,normalMovies),
                 ],
               ),
             ),
           );
         }
       else
       {
         return CircularProgressIndicator();
       }

    });


  }

  Widget buildAvailableNowList(BuildContext context, List <Movie> movie) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CarouselSlider(
        items: movie.map((movieItem)=>InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FilmDetails(movieId: movieItem.id!, allmovies: movie,)));
              },
            child: Cards(movie: movieItem , width: 234, heigh: 351,))).toList(), options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.38,
        aspectRatio: 16 / 9,
        viewportFraction: 0.5,
        initialPage:0,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        scrollDirection: Axis.horizontal,
      ),),
    );
  }
   buildWatchNowList(BuildContext context,List <Movie> latestmovies) {

    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(18),
          itemCount: latestmovies.length,
          itemBuilder: (context,index){
            return Cards(movie: latestmovies[index], width: 146,heigh: 220, );
          },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 14,);
      },),
    );
  }
}
