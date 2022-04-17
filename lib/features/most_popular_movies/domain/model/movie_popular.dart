class MoviePopular {
  final String posterUrl;
  final String title;

  MoviePopular({
    required this.posterUrl,
    required this.title,
  });

  static String defaultMovieTitle() => 'No title available';

  static String defaultPosterUrl() => 'https://image.shutterstock.com/'
      'image-vector/file-delete-260nw-686125981.jpg';
}
