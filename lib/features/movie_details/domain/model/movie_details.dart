class MovieDetails {
  final String id;
  final String title;
  final String overview;
  final String tagline;
  final double rating;
  final String posterUrl;

  MovieDetails({
    required this.id,
    required this.title,
    required this.overview,
    required this.tagline,
    required this.rating,
    required this.posterUrl,
  });

  static String defaultTitle = 'Missing title';

  static String defaultOverview = 'Missing overview';

  static String defaultTagline = 'Missing tagline';

  static double defaultRating = 0.0;
}
