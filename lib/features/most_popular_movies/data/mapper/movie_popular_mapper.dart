import 'package:cubit_architecture/core/mapper.dart';
import 'package:cubit_architecture/features/most_popular_movies/data/model/movie_popular_dto.dart';
import 'package:cubit_architecture/features/most_popular_movies/domain/model/movie_popular.dart';
import 'package:cubit_architecture/utils/constants.dart';
import 'package:cubit_architecture/utils/functions.dart';
import 'package:injectable/injectable.dart';

@Named("moviePopularMapper")
@Injectable(as: Mapper)
class MoviePopularMapper implements Mapper<MoviePopularDTO, MoviePopular> {
  @override
  MoviePopular map(MoviePopularDTO input) {
    return MoviePopular(
      posterUrl: input.posterPath != null
          ? buildPosterUrl(input.posterPath!)
          : kDefaultMoviePosterUrl,
      title: input.title ?? MoviePopular.defaultMovieTitle(),
      id: (input.id ?? _defaultId()).toString(),
    );
  }

  int _defaultId() => DateTime.now().millisecondsSinceEpoch;
}
