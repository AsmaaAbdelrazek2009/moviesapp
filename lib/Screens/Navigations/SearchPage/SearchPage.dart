import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import '../../../Cupit/MovieCupit.dart';
import '../../../Cupit/States.dart';
import '../../../Models/MoviesList/MoviesList.dart';
import '../../../Widgets/Card.dart';
import '../../../Widgets/TextFiled.dart';
import '../../FilmDetails/FileDetails.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, required this.allmovies});

  final List<Movie> allmovies;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: BlocConsumer<MovieCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MovieCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    TextField1(
                      lableTitle: "Search",
                      icon1: const Icon(Icons.search, color: Colors.white),
                      onChanged: (text) {
                        cubit.filterMovies(text, allmovies);
                      },
                    ),
                    const SizedBox(height: 20),

                    Expanded(
                      child: _buildSearchContent(cubit, context),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchContent(MovieCubit cubit, BuildContext context) {
    if (cubit.query.isEmpty) {
      return Center(
        child: Image.asset(AppAssets.popCorn, width: 200),
      );
    }

    if (cubit.FilteredList.isEmpty) {
      return const Center(
        child: Text(
          "No Movies Found",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.7,
      ),
      itemCount: cubit.FilteredList.length,
      itemBuilder: (context, index) {
        final movie = cubit.FilteredList[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FilmDetails(
                  movieId: movie.id!,
                  allmovies: allmovies,
                ),
              ),
            );
          },
          child: Cards(
            movie: movie,
            heigh: 279,
            width: 189,
          ),
        );
      },
    );
  }
}