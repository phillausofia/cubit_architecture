import 'package:cubit_architecture/core/mapper.dart';
import 'package:cubit_architecture/core/network/api_helper.dart';
import 'package:cubit_architecture/core/network/api_path.dart';
import 'package:cubit_architecture/features/most_popular_movies/data/model/movie_popular_dto.dart';
import 'package:cubit_architecture/features/most_popular_movies/data/model/movies_popular_response.dart';
import 'package:cubit_architecture/features/most_popular_movies/domain/model/movie_popular.dart';
import 'package:cubit_architecture/features/most_popular_movies/domain/repository/movies_popular_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MoviesPopularRepository)
class MoviesPopularRepositoryImpl implements MoviesPopularRepository {
  final ApiHelper _apiHelper;
  final Mapper<MoviePopularDTO, MoviePopular> _moviePopularMapper;

  MoviesPopularRepositoryImpl(
    this._apiHelper,
    @Named('moviePopularMapper') this._moviePopularMapper,
  );

  @override
  Future<List<MoviePopular>> getPopularMovies() async {
    final response = await _apiHelper.get(APIPath.mostPopularMovies);
    final popularMoviesDTO = MoviesPopularResponse.fromMap(response).results;
    return popularMoviesDTO
        .map<MoviePopular>((e) => _moviePopularMapper.map(e))
        .toList();
  }
}
