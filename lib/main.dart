import 'package:cubit_architecture/core/service_locator/injectable_configuration.dart';
import 'package:cubit_architecture/features/most_popular_movies/presentation/movies_popular_page.dart';
import 'package:cubit_architecture/features/movie_details/presentation/movie_details_page.dart';
import 'package:flutter/material.dart';

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
      initialRoute: MoviesPopularPage.route,
      routes: {
        MoviesPopularPage.route: (_) => const MoviesPopularPage(
              title: 'Movies Cubit Architecture',
            ),
        MovieDetailsPage.route: (_) => const MovieDetailsPage(),
      },
    );
  }
}
