import 'package:dio/dio.dart';
import 'package:moviesapp/Models/MoviesList/MoviesList.dart';

import '../Models/MovieDetails/MovieDetailsList.dart';

class Apimanager {

  static Future <List<Movie>> getMovies() async{
    final dio = Dio();
    Response response = await dio.get(
        "https://movies-api.accel.li/api/v2/list_movies.json");
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      Map<String, dynamic> jason = response.data;
      MovieResponse moviesResponse = MovieResponse.fromJson(jason);
      return moviesResponse.data!.movies;
    }
    throw "Error";
  }


  static Future<Movie2?> getMoviesDetails(int movieID) async {
    final dio = Dio();
    try {
      Response response = await dio.get(
          "https://movies-api.accel.li/api/v2/movie_details.json?movie_id=$movieID");

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        MoviesDetailsApiResponse moviesdetailsResponse =
        MoviesDetailsApiResponse.fromJson(response.data);

        return moviesdetailsResponse.data?.movie;
      }
    } catch (e) {
      print("Error fetching details: $e");
    }
    return null;
  }
}