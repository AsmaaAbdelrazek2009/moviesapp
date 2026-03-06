import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/Cupit/States.dart';

import '../API Manager/APIManager.dart';
import '../Models/MovieDetails/MovieDetailsList.dart';
import '../Models/MoviesList/MoviesList.dart';

class MovieCubit extends Cubit <States> {

   Movie2? movie2;
  MovieCubit() : super (MovieInitialState());
  static MovieCubit get (context)=>BlocProvider.of(context);

void getMovieDetails(int movieId)
{
  emit(MovieDetailsLoadingState());

  Apimanager.getMoviesDetails(movieId).then((value){
    if(value!=null)
      {
        movie2=value;
        emit(MovieDetailsSucessState(value));
      }
  }).catchError((Error){
    emit(MovieDetailsErrorState(Error.toString()));
  });

}


  void getHomeMovies() {
    emit(MovieDetailsLoadingState());
    Apimanager.getMovies().then((movies) {
      allmovies = movies;
      emit(ExploreMovieDetailsSucessState(movies));
    }).catchError((error) {
      emit(ExploreMovieDetailsErrorState(error.toString()));
    });
  }

  bool isSelected=true;
void changeBookMarke()
{
    isSelected = !isSelected;
    emit(ChangeBookMarkState());

}

   List <Movie> FilteredList=[];
   String query = "";
  void filterMovies(String selectedWord, List <Movie> allmovies)
   {

       query = selectedWord;
       if (selectedWord.isEmpty) {
         FilteredList = [];
       }
       else {
         FilteredList = allmovies.where((movie) {
           return movie.title!.toLowerCase().contains(selectedWord.toLowerCase());
         }).toList();
       }
         emit(MovieSearchState());

   }

   List <Movie> allmovies=[];
   var currentIndex=0;
   List<String> allGenres =[];
   List <Movie> filterdMovies=[];

   void GetExploreMoviesFilter() {

     Apimanager.getMovies().then((value) {
       allmovies = value;
       allGenres = allmovies.expand((m) => m.genres ?? <String>[]).toSet().toList();

       if (allGenres.isNotEmpty) {
         currentIndex = 0;
         filterdMovies = allmovies.where((m) => m.genres!.contains(allGenres[0])).toList();
       }

       emit(ExploreMovieDetailsSucessState(allmovies));
     }).catchError((error) {
       emit(ExploreMovieDetailsErrorState(error.toString()));
     });
   }

   changeExploreTab(int index)
   {
     currentIndex=index;
     String SelectedGenre=allGenres[currentIndex];
     filterdMovies = allmovies.where((movie) =>
     movie.genres?.contains(SelectedGenre) ?? false).toList();
     emit(ChangeCategoryState());
   }




}