import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';

import '../../../Cupit/Cupit.dart';
import '../../../Cupit/States.dart';
import '../../../Models/MoviesList/MoviesList.dart';
import '../../../Widgets/Card.dart';
import '../../../Widgets/TextFiled.dart';

class SearchPage extends StatelessWidget {
   SearchPage({super.key, required this.allmovies});

  final List<Movie> allmovies;


  TextEditingController searchController= TextEditingController();
   List <Movie> FilteredList=[];
  String query = "";


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>MovieCubit(),
      child:BlocConsumer<MovieCubit,States>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = MovieCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TextField1( lableTitle: "Search", icon1: Icon(Icons.search),

                      onChanged: (text) {
                        cubit.filterMovies(text, allmovies);

                      },
                    ),

                    const SizedBox(height: 20),
                    Expanded(
                      child: cubit.query.isEmpty
                          ? Center(child: Image.asset(AppAssets.popCorn))
                          : cubit.FilteredList.isEmpty
                          ? const Center(
                        child: Text(
                            "No Movies Found",
                            style: TextStyle(color: Colors.white, fontSize: 18)
                        ),
                      )
                          : GridView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: cubit.FilteredList.length,
                        itemBuilder: (context, index) {
                          return Cards(
                            movie: cubit.FilteredList[index],
                            heigh: 279,
                            width: 189,
                          );
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ) ,
          );
        }

      ) ,);
  }


}
