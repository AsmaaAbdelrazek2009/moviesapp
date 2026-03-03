import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/API%20Manager/APIManager.dart';
import 'package:moviesapp/Cupit/Cupit.dart';
import 'package:moviesapp/Cupit/States.dart';
import 'package:moviesapp/Utilites/AppColors.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';
import 'package:moviesapp/Widgets/Card.dart';

import '../../../Models/MoviesList/MoviesList.dart';

class ExplorePage extends StatelessWidget {
   ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> MovieCubit()..GetExploreMoviesFilter(),
    child: BlocConsumer<MovieCubit,States>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = MovieCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.black,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(icon: Icon(
                  Icons.arrow_back, size: 30,
                  color: AppColors.white,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                buildTabBar(cubit.allGenres,context),
                Expanded(
                  child: buildFilteredMoviesList(cubit.filterdMovies),
                ),
              ],
            ),
          ),
        );
      }
    ),);
  }

  Widget buildTabBar(List <String> genres,BuildContext context) {
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
        MovieCubit.get(context).changeExploreTab( index);


      },
      tabs: List.generate(MovieCubit.get(context).allGenres.length,
              (index){
        bool isSelected =  MovieCubit.get(context).currentIndex == index;
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
