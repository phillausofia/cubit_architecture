import 'package:cubit_architecture/core/service_locator/injectable_configuration.dart';
import 'package:cubit_architecture/features/movie_details/domain/model/movie_details.dart';
import 'package:cubit_architecture/features/movie_details/presentation/movie_details_cubit.dart';
import 'package:cubit_architecture/features/movie_details/presentation/movie_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsPageArguments {
  final String movieId;

  MovieDetailsPageArguments({
    required this.movieId,
  });
}

class MovieDetailsPage extends StatefulWidget {
  static const route = "movieDetails";

  final MovieDetailsPageArguments _movieDetailsPageArguments;

  const MovieDetailsPage(
      this._movieDetailsPageArguments,
  {Key? key}): super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  MovieDetailsPageArguments get _args => widget._movieDetailsPageArguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (_) {
            final cubit = getIt<MovieDetailsCubit>();
            cubit.fetchData(_args.movieId);
            return cubit;
          },
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            builder: (BuildContext context, state) {
              if (state is MovieDetailsStateContent) {
                return _showMovieDetails(state.movie);
              } else if (state is MovieDetailsStateError) {
                return _errorUIState();
              }
              return _loadingUIState();
            },
        ),
      ),
    );
  }

  Widget _loadingUIState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _errorUIState() {
    return const Text('Something went wrong');
  }

  Widget _showMovieDetails(MovieDetails moviesDetails) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(moviesDetails.posterUrl),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${moviesDetails.title} - ${moviesDetails.rating}★',
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.headline6?.fontSize,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          moviesDetails.tagline,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.bodyText1?.fontSize,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  moviesDetails.overview,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyText1?.fontSize,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
