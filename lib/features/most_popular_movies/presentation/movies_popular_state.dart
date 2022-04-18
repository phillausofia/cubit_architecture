
import 'package:cubit_architecture/features/most_popular_movies/domain/model/movie_popular.dart';

abstract class MoviesPopularState {
  MoviesPopularState._();

  factory MoviesPopularState.loading() =>
      MoviesPopularStateLoading._();

  factory MoviesPopularState.content(List<MoviePopular> movies) =>
      MoviesPopularStateContent._(movies);

  factory MoviesPopularState.error() =>
      MoviesPopularStateError._();
}

class MoviesPopularStateLoading extends MoviesPopularState {
  MoviesPopularStateLoading._() : super._();
}

class MoviesPopularStateContent extends MoviesPopularState {
  List<MoviePopular> movies;
  MoviesPopularStateContent._(this.movies) : super._();
}

class MoviesPopularStateError extends MoviesPopularState {
  MoviesPopularStateError._() : super._();
}