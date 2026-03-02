import 'package:flutter/material.dart';
import 'package:moviesapp/API%20Manager/APIManager.dart';
import 'package:moviesapp/Utilites/AppColors.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';
import 'package:moviesapp/Widgets/Card.dart';

import '../../../Models/MoviesList/MoviesList.dart';

class ExplorePage extends StatefulWidget {
   ExplorePage({super.key, required this.allmovies});



  List <Movie> allmovies;
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  var _currentIndex=0;

  List <Movie> filterdMovies=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
       child: FutureBuilder(future: Apimanager.getMovies(), builder: (context,snapshot){

         if(snapshot.hasError)
           {
             return Text("Error");
           }
         else if (snapshot.hasData)
           {
             List <Movie> movies=snapshot.data!;
             List<String> allGenres = movies
                 .expand((movie) => movie.genres ?? <String>[])
                 .toSet()
                 .toList();
             filterdMovies = movies.where((movie) =>
             movie.genres?.contains(allGenres[_currentIndex]) ?? false).toList();
             return Column(
               children: [
                 buildTabBar(allGenres),
                 Expanded(
                   child: buildFilteredMoviesList(filterdMovies),
                 ),



               ],
             );
           }
         else
           {
             return CircularProgressIndicator();
           }
       })),


    );
  }

  Widget buildTabBar(List <String> genres) {
return
  DefaultTabController(
      length: genres.length,
      child: TabBar(
      isScrollable: true,
      indicatorColor: Colors.transparent,
      unselectedLabelColor: AppColors.yellow,
      unselectedLabelStyle: AppTextStyles.yellowText600mediam20,
      labelStyle: AppTextStyles.blackText600mediam20,
      tabAlignment: TabAlignment.start,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      onTap: (index){
        setState(() {
          _currentIndex = index;
          filterdMovies = widget.allmovies.where((movie) => movie.genres!.contains(genres[index])).toList();
          buildFilteredMoviesList(filterdMovies);
        });

      },
      tabs: List.generate(genres.length,
              (index){
        bool isSelected = _currentIndex == index;
        return Container(
          width: 132,
          height: 48,
          decoration: BoxDecoration(
              color: isSelected ? AppColors.yellow: AppColors.black,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.yellow)
          ),
           child: Center(child: Text(genres[index])),
        );


      })));


  }

  buildFilteredMoviesList(List <Movie> filterdMovies)
  {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount:filterdMovies.length ,
        itemBuilder: (context, index){
          return Cards(movie: filterdMovies[index], heigh: 189, width: 279);

        });
  }


}
