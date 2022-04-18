import 'package:cubit_architecture/features/most_popular_movies/domain/model/movie_popular.dart';
import 'package:flutter/material.dart';

class MoviePopularListItem extends StatelessWidget {
  const MoviePopularListItem({
    Key? key,
    required this.moviePopular,
  }) : super(key: key);

  final MoviePopular moviePopular;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                moviePopular.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Image.network(moviePopular.posterUrl),
          ),
        ],
      ),
    );
  }
}
