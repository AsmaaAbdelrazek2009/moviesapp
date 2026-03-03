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
