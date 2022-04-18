import 'package:cubit_architecture/core/mapper.dart';
import 'package:cubit_architecture/core/network/api_helper.dart';
import 'package:cubit_architecture/core/network/api_path.dart';
import 'package:cubit_architecture/features/most_popular_movies/data/model/movies_popular_response.dart';
import 'package:cubit_architecture/features/most_popular_movies/domain/model/movie_popular.dart';
import 'package:cubit_architecture/features/most_popular_movies/domain/repository/movies_popular_repository.dart';
import 'package:injectable/injectable.dart';

class MoviesPopularRepositoryImpl implements MoviesPopularRepository {
  final ApiHelper _apiHelper;
  final Mapper _moviePopularMapper;

  MoviesPopularRepositoryImpl(this._apiHelper, this._moviePopularMapper);

  @override
  Future<List<MoviePopular>> getPopularMovies() async {
    final response = await _apiHelper.get(APIPath.mostPopularMovies);
    final popularMoviesDTO = MoviesPopularResponse.fromMap(response).results;
    return popularMoviesDTO
        .map<MoviePopular>((e) => _moviePopularMapper.map(e))
        .toList();
  }
}
