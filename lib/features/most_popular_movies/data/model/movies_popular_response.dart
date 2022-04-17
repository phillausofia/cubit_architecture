import 'package:cubit_architecture/features/most_popular_movies/data/model/movie_popular_dto.dart';

class MoviesPopularResponse {
  final List<MoviePopularDTO> results;

  MoviesPopularResponse(this.results);

  factory MoviesPopularResponse.fromMap(Map<String, dynamic> map) {
    return MoviesPopularResponse(
      List<Map<String, dynamic>>.from(map['results'] ?? [])
          .map((e) => MoviePopularDTO.fromMap(e))
          .toList(),
    );
  }
}
