import 'package:cubit_architecture/core/service_locator/injectable_configuration.dart';
import 'package:cubit_architecture/features/most_popular_movies/presentation/movie_popular_list_item.dart';
import 'package:cubit_architecture/features/most_popular_movies/presentation/movies_popular_cubit.dart';
import 'package:cubit_architecture/features/most_popular_movies/presentation/movies_popular_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesPopularPage extends StatefulWidget {

  static const String route = '/movies_popular';

  const MoviesPopularPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MoviesPopularPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MoviesPopularPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (_) => getIt<MoviesPopularCubit>(),
        child: BlocBuilder<MoviesPopularCubit, MoviesPopularState>(
          builder: (BuildContext context, state) {
            if (state is MoviesPopularStateContent) {
              final movies = state.movies;
              return ListView.separated(
                itemBuilder: (_, index) => MoviePopularListItem(
                  moviePopular: movies[index],
                ),
                separatorBuilder: (_, __) => const Divider(
                  color: Colors.white,
                ),
                itemCount: movies.length,
              );
            } else if (state is MoviesPopularStateError) {
              return const Text('Error loading the most popular movies');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}