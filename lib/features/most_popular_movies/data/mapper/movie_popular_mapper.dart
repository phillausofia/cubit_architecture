import 'package:cubit_architecture/core/mapper.dart';
import 'package:cubit_architecture/features/most_popular_movies/data/model/movie_popular_dto.dart';
import 'package:cubit_architecture/features/most_popular_movies/domain/model/movie_popular.dart';

class MoviePopularMapper implements Mapper<MoviePopularDTO, MoviePopular> {
  @override
  MoviePopular map(MoviePopularDTO input) {
    return MoviePopular(
      posterUrl: input.posterPath != null
          ? _buildPosterUrl(input.posterPath!)
          : MoviePopular.defaultPosterUrl(),
      title: input.title ?? MoviePopular.defaultMovieTitle(),
    );
  }

  String _buildPosterUrl(String posterPath) => Uri.https(
        'image.tmdb.org',
        't/p/w500' + posterPath,
        {'apiKey': '51c33d10ebc31ef012b00c9b8d05b2de'},
      ).toString();
}
