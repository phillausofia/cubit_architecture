// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/most_popular_movies/data/mapper/movie_popular_mapper.dart'
    as _i8;
import '../../features/most_popular_movies/data/model/movie_popular_dto.dart'
    as _i6;
import '../../features/most_popular_movies/data/repository/movies_popular_repository_impl.dart'
    as _i15;
import '../../features/most_popular_movies/domain/model/movie_popular.dart'
    as _i7;
import '../../features/most_popular_movies/domain/repository/movies_popular_repository.dart'
    as _i14;
import '../../features/most_popular_movies/presentation/movies_popular_cubit.dart'
    as _i17;
import '../../features/movie_details/data/mapper/movie_details_mapper.dart'
    as _i11;
import '../../features/movie_details/data/model/movie_details_dto.dart' as _i9;
import '../../features/movie_details/data/repository/movie_details_repository_impl.dart'
    as _i13;
import '../../features/movie_details/domain/model/movie_details.dart' as _i10;
import '../../features/movie_details/domain/repository/movie_details_repository.dart'
    as _i12;
import '../../features/movie_details/presentation/movie_details_cubit.dart'
    as _i16;
import '../mapper.dart' as _i5;
import '../network/api_helper.dart' as _i3;
import '../network/api_helper_impl.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ApiHelper>(() => _i4.ApiHelperImpl());
  gh.factory<_i5.Mapper<_i6.MoviePopularDTO, _i7.MoviePopular>>(
      () => _i8.MoviePopularMapper(),
      instanceName: 'moviePopularMapper');
  gh.factory<_i5.Mapper<_i9.MovieDetailsDTO, _i10.MovieDetails>>(
      () => _i11.MovieDetailsMapper(),
      instanceName: 'movieDetailsMapper');
  gh.lazySingleton<_i12.MovieDetailsRepository>(() =>
      _i13.MovieDetailsRepositoryImpl(
          get<_i3.ApiHelper>(),
          get<_i5.Mapper<_i9.MovieDetailsDTO, _i10.MovieDetails>>(
              instanceName: 'movieDetailsMapper')));
  gh.lazySingleton<_i14.MoviesPopularRepository>(() =>
      _i15.MoviesPopularRepositoryImpl(
          get<_i3.ApiHelper>(),
          get<_i5.Mapper<_i6.MoviePopularDTO, _i7.MoviePopular>>(
              instanceName: 'moviePopularMapper')));
  gh.lazySingleton<_i16.MovieDetailsCubit>(
      () => _i16.MovieDetailsCubit(get<_i12.MovieDetailsRepository>()));
  gh.lazySingleton<_i17.MoviesPopularCubit>(
      () => _i17.MoviesPopularCubit(get<_i14.MoviesPopularRepository>()));
  return get;
}
