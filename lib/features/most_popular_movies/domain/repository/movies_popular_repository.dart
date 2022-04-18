import 'package:cubit_architecture/features/most_popular_movies/domain/model/movie_popular.dart';

abstract class MoviesPopularRepository {
  Future<List<MoviePopular>> getPopularMovies();
}