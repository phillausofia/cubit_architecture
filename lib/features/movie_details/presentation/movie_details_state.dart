import 'package:cubit_architecture/features/movie_details/domain/model/movie_details.dart';

abstract class MovieDetailsState {
  MovieDetailsState._();

  factory MovieDetailsState.loading() =>
      MovieDetailsStateLoading._();

  factory MovieDetailsState.content(MovieDetails movie) =>
      MovieDetailsStateContent._(movie);

  factory MovieDetailsState.error() =>
      MovieDetailsStateError._();
}

class MovieDetailsStateLoading extends MovieDetailsState {
  MovieDetailsStateLoading._() : super._();
}

class MovieDetailsStateContent extends MovieDetailsState {
  MovieDetails movie;
  MovieDetailsStateContent._(this.movie) : super._();
}

class MovieDetailsStateError extends MovieDetailsState {
  MovieDetailsStateError._() : super._();
}