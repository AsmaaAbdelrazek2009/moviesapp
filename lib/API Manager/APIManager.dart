import 'package:dio/dio.dart';
import 'package:moviesapp/Models/MoviesList/MoviesList.dart';
import '../Models/MovieDetails/MovieDetailsList.dart';

class Apimanager {
  static final Dio _dio = Dio();

  static const String _baseUrl = "https://yts.lt/api/v2";

  static Future<List<Movie>> getMovies() async {
    try {
      Response response = await _dio.get("$_baseUrl/list_movies.json");

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        MovieResponse moviesResponse = MovieResponse.fromJson(response.data);
        return moviesResponse.data?.movies ?? [];
      }
    } catch (e) {
      print("Error fetching movies: $e");
    }
    throw "Failed to load movies";
  }

  static Future<Movie2?> getMoviesDetails(int movieID) async {
    try {
      Response response = await _dio.get(
        "$_baseUrl/movie_details.json",
        queryParameters: {
          'movie_id': movieID,
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        MoviesDetailsApiResponse moviesDetailsResponse =
        MoviesDetailsApiResponse.fromJson(response.data);

        return moviesDetailsResponse.data?.movie;
      }
    } catch (e) {
      print("Error fetching movie details: $e");
    }
    return null;
  }
}