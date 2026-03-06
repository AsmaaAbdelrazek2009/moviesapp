import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/Models/MovieDetails/MovieDetailsList.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';
import '../../Cupit/Cupit.dart';
import '../../Cupit/States.dart';
import '../../FirebaseUtilities/userCollections.dart';
import '../../Models/MoviesList/MoviesList.dart';
import '../../Utilites/AppColors.dart';
import '../../Widgets/Button.dart';
import '../../Widgets/Card.dart';
import 'package:url_launcher/url_launcher.dart';

class FilmDetails extends StatelessWidget {
   FilmDetails({super.key, required this.movieId, required this.allmovies});
  final int movieId;
  final List<Movie> allmovies;



  // final MoviesDetails2 moviedetails;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      body: BlocProvider(create: (context)=>MovieCubit()..getMovieDetails(movieId),
          child: BlocConsumer<MovieCubit,States>(

            listener: (context, state) {
            },

            builder: ( context,  state) {
              if (MovieCubit.get(context).movie2 != null) {
                final moviesdetails = MovieCubit.get(context).movie2 ;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            moviesdetails!.mediumCoverImage, fit: BoxFit.cover,
                            width: double.infinity,),
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.8,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
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
                                Center(child: Image.asset(
                                  AppAssets.Play, width: 70,)),
                                SizedBox(height: 250,),
                                Center(child: Text(moviesdetails.title,
                                  style: AppTextStyles
                                      .whiteHeader700mediam24,)),
                                SizedBox(height: 25,),
                                Text(moviesdetails.year.toString(),
                                  style: AppTextStyles
                                      .greySubHeader400mediam20,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 40),
                            child: Row(
                              children: [
                                IconButton(icon: Icon(
                                  Icons.arrow_back, size: 30,
                                  color: AppColors.white,),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Spacer(),
                                IconButton(icon: Icon(
                                  MovieCubit.get(context).isSelected ? Icons.bookmark_border : Icons
                                      .bookmark, size: 30,
                                  color: AppColors.white,),
                                  onPressed: () {
                                    MovieCubit.get(context).changeBookMarke();
                                    if (!MovieCubit.get(context).isSelected) {
                                      MyDatabase.addToWatchList(moviesdetails);
                                    } else {
                                      MyDatabase.removeFromWatchList(moviesdetails.id);
                                    }
                                  },

                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      AppButton(text: "Watch",
                        onPressed: () async {
                          if (moviesdetails.url != null) {
                            final Uri url = Uri.parse(moviesdetails.url);
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                            else {
                              throw "Could not launch $url";
                            }
                          }
                        },
                        color1: AppColors.red,
                        color2: AppColors.red,
                        TextColor: AppColors.white,),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          buildFavTimeStarContainer(
                              moviesdetails.likeCount.toString(),
                              Icons.favorite),
                          Spacer(),
                          buildFavTimeStarContainer(
                              moviesdetails.runtime.toString(),
                              Icons.timelapse),
                          Spacer(),
                          buildFavTimeStarContainer(
                              moviesdetails.rating.toString(), Icons.star),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ScreenShots",
                              style: AppTextStyles.whiteHeader700mediam24,),
                            buildListView(moviesdetails),
                            SizedBox(height: 10,),
                            Text("Similar ",
                              style: AppTextStyles.whiteHeader700mediam24,),

                            buildFilmGridView(moviesdetails,allmovies),
                            SizedBox(height: 16,),
                            Text("Summery ",
                              style: AppTextStyles.whiteHeader700mediam24,),
                            SizedBox(height: 8,),
                            SizedBox(
                              width: 398,
                              child: Text(moviesdetails.descriptionFull,
                                style: AppTextStyles
                                    .whitesubHeader400mediam16,),
                            ),
                            Text("Cast ",
                              style: AppTextStyles.whiteHeader700mediam24,),

                            buildCastCard(),
                            buildCastCard(),
                            buildCastCard(),

                            buildGenres(moviesdetails.genres),


                          ],
                        ),
                      )

                    ],
                  ),
                );
              }
              else
                {
                  return CircularProgressIndicator();
                }

            },

          ),
    )
    );
  }

  Widget buildListView(Movie2 moviesdetails) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 16,),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context,index){
                    return Container(
                      height: 167,
                      width: 398,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.network(moviesdetails.backgroundImage,fit: BoxFit.cover,),
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

  Widget buildFilmGridView( Movie2 currentMovie, List<Movie> allmovies) {
    List<Movie> similarMovies = allmovies.where((m) {
      return m.genres!.any((g) => currentMovie.genres.contains(g)) && m.id != currentMovie.id;
    }).toList();
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 0.7,
    ),
        itemCount: similarMovies.length > 4 ? 4 :  similarMovies.length ,
        itemBuilder: (context, index){
          return InkWell(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FilmDetails(movieId: allmovies[index].id!, allmovies: allmovies,)));

              },
              child: Cards(movie: similarMovies[index], heigh: 189, width: 279));

        });
  }

  buildCastCard() {
    return Card(

      color: AppColors.Grey,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: Image.asset(
          AppAssets.gamer2,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        ),
        title: Text("Name",style: AppTextStyles.whitesubHeader400mediam20,),
        subtitle: Text("Character",style: AppTextStyles.whitesubHeader400mediam20,),
      ),
    );
  }

  Widget buildGenres(List<String> genres) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Genres", style: AppTextStyles.whiteHeader700mediam24),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: genres.map((genre) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.Grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              genre,
              style: AppTextStyles.whitesubHeader400mediam16,
            ),
          )).toList(),
        ),
      ],
    );
  }
}
