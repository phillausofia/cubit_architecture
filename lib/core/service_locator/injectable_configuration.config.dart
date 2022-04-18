// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/most_popular_movies/domain/repository/movies_popular_repository.dart'
    as _i6;
import '../../features/most_popular_movies/presentation/movies_popular_cubit.dart'
    as _i5;
import '../../features/movie_details/domain/repository/movie_details_repository.dart'
    as _i4;
import '../../features/movie_details/presentation/movie_details_cubit.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.MovieDetailsCubit>(
      () => _i3.MovieDetailsCubit(get<_i4.MovieDetailsRepository>()));
  gh.factory<_i5.MoviesPopularCubit>(
      () => _i5.MoviesPopularCubit(get<_i6.MoviesPopularRepository>()));
  return get;
}
