import 'package:cubit_architecture/features/movie_details/domain/model/movie_details.dart';

abstract class MovieDetailsRepository{
  Future<MovieDetails> getMovieDetails(String movieId);
}