import 'package:cubit_architecture/core/mapper.dart';
import 'package:cubit_architecture/core/network/api_helper.dart';
import 'package:cubit_architecture/core/network/api_path.dart';
import 'package:cubit_architecture/features/movie_details/data/mapper/movie_details_mapper.dart';
import 'package:cubit_architecture/features/movie_details/data/model/movie_details_dto.dart';
import 'package:cubit_architecture/features/movie_details/domain/model/movie_details.dart';
import 'package:cubit_architecture/features/movie_details/domain/repository/movie_details_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MovieDetailsRepository)
class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final ApiHelper _apiHelper;
  final Mapper<MovieDetailsDTO, MovieDetails> _movieDetailsMapper;

  MovieDetailsRepositoryImpl(
    this._apiHelper,
    @Named('movieDetailsMapper') this._movieDetailsMapper,
  );

  @override
  Future<MovieDetails> getMovieDetails(String movieId) async {
    final response = await _apiHelper.get(APIPath.movieDetails(movieId));
    final movieDetailsDTO = MovieDetailsDTO.fromMap(response);
    return _movieDetailsMapper.map(movieDetailsDTO);
  }
}
