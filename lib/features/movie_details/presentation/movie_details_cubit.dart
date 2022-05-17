import 'package:cubit_architecture/features/movie_details/domain/repository/movie_details_repository.dart';
import 'package:cubit_architecture/features/movie_details/presentation/movie_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MovieDetailsCubit extends Cubit<MovieDetailsState> {

  final MovieDetailsRepository _repository;

  MovieDetailsCubit(this._repository) : super(MovieDetailsState.loading());

  Future<void> fetchData(String movieId) async {
    try {
      final results = await _repository.getMovieDetails(movieId);
      emit(MovieDetailsState.content(results));
    } catch (e) {
      emit(MovieDetailsState.error());
    }
  }

}