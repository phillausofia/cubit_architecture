import 'package:cubit_architecture/core/network/api_helper.dart';
import 'package:cubit_architecture/core/network/api_helper_impl.dart';
import 'package:cubit_architecture/features/most_popular_movies/data/mapper/movie_popular_mapper.dart';
import 'package:cubit_architecture/features/most_popular_movies/data/repository/movies_popular_repository_impl.dart';
import 'package:cubit_architecture/features/most_popular_movies/domain/repository/movies_popular_repository.dart';
import 'package:cubit_architecture/utils/constants.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'injectable_configuration.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() {
  getIt.registerLazySingleton<ApiHelper>(
    () => ApiHelperImpl(
      client: Client(),
      baseUrl: kTmdbBaseUrl,
      apiKey: kTmdbApiKey,
    ),
  );
  getIt.registerLazySingleton<MoviesPopularRepository>(
    () => MoviesPopularRepositoryImpl(getIt(), MoviePopularMapper()),
  );
  $initGetIt(getIt);
}
