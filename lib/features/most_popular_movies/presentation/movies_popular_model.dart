
import 'package:cubit_architecture/features/most_popular_movies/domain/model/movie_popular.dart';

abstract class MoviesPopularViewModel {
  MoviesPopularViewModel._();

  factory MoviesPopularViewModel.loading() =>
      MoviesPopularViewModelLoading._();

  factory MoviesPopularViewModel.content(List<MoviePopular> movies) =>
      MoviesPopularViewModelContent._(movies);

  factory MoviesPopularViewModel.error() =>
      HomeViewModelError._();
}

class MoviesPopularViewModelLoading extends MoviesPopularViewModel {
  MoviesPopularViewModelLoading._() : super._();
}

class MoviesPopularViewModelContent extends MoviesPopularViewModel {
  List<MoviePopular> movies;
  MoviesPopularViewModelContent._(this.movies) : super._();
}

class HomeViewModelError extends MoviesPopularViewModel {
  HomeViewModelError._() : super._();
}