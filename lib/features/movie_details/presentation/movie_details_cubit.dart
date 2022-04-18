import 'package:cubit_architecture/features/movie_details/domain/repository/movie_details_repository.dart';
import 'package:cubit_architecture/features/movie_details/presentation/movie_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {

  final MovieDetailsRepository _repository;
  final String _movieId;

  MovieDetailsCubit(this._repository, this._movieId) : super(MovieDetailsState.loading()) {
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final results = await _repository.getMovieDetails(_movieId);
      emit(MovieDetailsState.content(results));
    } catch (e) {
      emit(MovieDetailsState.error());
    }
  }

}