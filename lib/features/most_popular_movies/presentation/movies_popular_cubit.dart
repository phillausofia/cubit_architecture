import 'package:cubit_architecture/features/most_popular_movies/domain/repository/movies_popular_repository.dart';
import 'package:cubit_architecture/features/most_popular_movies/presentation/movies_popular_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MoviesPopularCubit extends Cubit<MoviesPopularState> {

 final MoviesPopularRepository _repository;

  MoviesPopularCubit(this._repository) : super(MoviesPopularState.loading()) {
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final results = await _repository.getPopularMovies();
      emit(MoviesPopularState.content(results));
    } catch (e) {
      emit(MoviesPopularState.error());
    }
  }

}