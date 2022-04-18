import 'package:cubit_architecture/features/most_popular_movies/domain/repository/movies_popular_repository.dart';
import 'package:cubit_architecture/features/most_popular_movies/presentation/movies_popular_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MoviesPopularCubit extends Cubit<MoviesPopularViewModel> {

 final MoviesPopularRepository _repository;

  MoviesPopularCubit(this._repository) : super(MoviesPopularViewModel.loading()) {
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final results = await _repository.getPopularMovies();
      emit(MoviesPopularViewModel.content(results));
    } catch (e) {
      emit(MoviesPopularViewModel.error());
    }
  }

}