import 'package:cubit_architecture/core/network/api_helper_impl.dart';
import 'package:cubit_architecture/core/service_locator/injectable_configuration.dart';
import 'package:cubit_architecture/features/most_popular_movies/data/mapper/movie_popular_mapper.dart';
import 'package:cubit_architecture/features/most_popular_movies/data/repository/movies_popular_repository_impl.dart';
import 'package:cubit_architecture/features/most_popular_movies/domain/repository/movies_popular_repository.dart';
import 'package:cubit_architecture/features/most_popular_movies/presentation/movie_popular_list_item.dart';
import 'package:cubit_architecture/features/most_popular_movies/presentation/movies_popular_cubit.dart';
import 'package:cubit_architecture/features/most_popular_movies/presentation/movies_popular_model.dart';
import 'package:cubit_architecture/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'features/most_popular_movies/presentation/movies_popular_model.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    MoviesPopularRepositoryImpl(
      ApiHelperImpl(
          baseUrl: kTmdbBaseUrl, apiKey: kTmdbApiKey, client: Client()),
      MoviePopularMapper(),
    ).getPopularMovies().then((value) => print('movie lenght: ${value.length}'));
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (_) => getIt<MoviesPopularCubit>(),
        child: BlocBuilder<MoviesPopularCubit, MoviesPopularViewModel>(
          builder: (BuildContext context, state) {
            if (state is MoviesPopularViewModelContent) {
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
            } else if (state is MoviesPopularViewModelError) {
              return const Text('Error loading the most popular movies');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
