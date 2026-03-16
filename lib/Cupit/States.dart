import 'package:flutter/cupertino.dart';

import '../Models/MovieDetails/MovieDetailsList.dart';
import '../Models/MoviesList/MoviesList.dart';

abstract class States{


}


class MovieInitialState extends States{

}

class MovieDetailsSucessState extends States{

  final Movie2 movie;
  MovieDetailsSucessState(this.movie);

}


class MovieDetailsErrorState extends States{

  final String ErrorMessage;
  MovieDetailsErrorState(this.ErrorMessage);

}

class MovieDetailsLoadingState extends States{

}

class ChangeBookMarkState extends States{

}

class MovieSearchState extends States{

}


class ExploreMovieDetailsSucessState extends States{

  final List <Movie> movie;
  ExploreMovieDetailsSucessState(this.movie);

}


class ExploreMovieDetailsErrorState extends States{

  final String ErrorMessage;
  ExploreMovieDetailsErrorState(this.ErrorMessage);

}


class ChangeCategoryState extends States{

}

class ForgetPasswordState extends States{
}

class ProfileInitialState extends States{

}
class ProfileLoadingState extends States {}

class ProfileSuccessState extends States {
  final List<Movie2> watchList;
  final List<Movie2> history;
  ProfileSuccessState(this.watchList, this.history);
}

class ProfileErrorState extends States {
  final String errorMessage;
  ProfileErrorState(this.errorMessage);
}

