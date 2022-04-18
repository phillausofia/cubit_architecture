import 'package:cubit_architecture/core/mapper.dart';
import 'package:cubit_architecture/features/most_popular_movies/domain/model/movie_popular.dart';
import 'package:cubit_architecture/features/movie_details/data/model/movie_details_dto.dart';
import 'package:cubit_architecture/features/movie_details/domain/model/movie_details.dart';

class MovieDetailsMapper implements Mapper<MovieDetailsDTO, MovieDetails> {
  @override
  MovieDetails map(MovieDetailsDTO input) {
    return MovieDetails(
      id: (input.id ?? _getMovieIdFromCurrentDate()).toString(),
      title: input.title ?? MovieDetails.defaultTitle,
      posterUrl: input.posterPath != null
          ? _buildPosterUrl(input.posterPath!)
          : MoviePopular.defaultPosterUrl(),
      overview: input.overview ?? MovieDetails.defaultOverview,
      rating: input.rating ?? MovieDetails.defaultRating,
      tagline: input.tagline ?? MovieDetails.defaultTagline,
    );
  }

  int _getMovieIdFromCurrentDate() => DateTime.now().millisecondsSinceEpoch;

  String _buildPosterUrl(String posterPath) => Uri.https(
    'image.tmdb.org',
    't/p/w500' + posterPath,
    {'apiKey': '51c33d10ebc31ef012b00c9b8d05b2de'},
  ).toString();
}
