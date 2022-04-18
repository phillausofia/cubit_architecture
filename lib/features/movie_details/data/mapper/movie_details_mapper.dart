import 'package:cubit_architecture/core/mapper.dart';
import 'package:cubit_architecture/features/most_popular_movies/domain/model/movie_popular.dart';
import 'package:cubit_architecture/features/movie_details/data/model/movie_details_dto.dart';
import 'package:cubit_architecture/features/movie_details/domain/model/movie_details.dart';
import 'package:cubit_architecture/utils/constants.dart';
import 'package:cubit_architecture/utils/functions.dart';

class MovieDetailsMapper implements Mapper<MovieDetailsDTO, MovieDetails> {
  @override
  MovieDetails map(MovieDetailsDTO input) {
    return MovieDetails(
      id: (input.id ?? _getMovieIdFromCurrentDate()).toString(),
      title: input.title ?? MovieDetails.defaultTitle,
      posterUrl: input.posterPath != null
          ? buildPosterUrl(input.posterPath!)
          : kDefaultMoviePosterUrl,
      overview: input.overview ?? MovieDetails.defaultOverview,
      rating: input.rating ?? MovieDetails.defaultRating,
      tagline: input.tagline ?? MovieDetails.defaultTagline,
    );
  }

  int _getMovieIdFromCurrentDate() => DateTime.now().millisecondsSinceEpoch;
}
