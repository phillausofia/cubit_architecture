class MoviePopular {
  final String posterUrl;
  final String title;
  final String id;

  MoviePopular({
    required this.posterUrl,
    required this.title,
    required this.id,
  });

  static String defaultMovieTitle() => 'No title available';

  static String defaultPosterUrl() => 'https://image.shutterstock.com/'
      'image-vector/file-delete-260nw-686125981.jpg';
}
