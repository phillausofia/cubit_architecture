class MovieDetailsDTO {
  final int? id;
  final String? title;
  final String? overview;
  final String? tagline;
  final double? rating;
  final String? posterPath;

  MovieDetailsDTO({
    this.id,
    this.title,
    this.overview,
    this.tagline,
    this.rating,
    this.posterPath,
  });

  factory MovieDetailsDTO.fromMap(Map<String, dynamic> map) {
    return MovieDetailsDTO(
      id: map['id'],
      title: map['title'],
      overview: map['overview'],
      tagline: map['tagline'],
      rating: map['vote_average'].toDouble(),
      posterPath: map['backdrop_path'],
    );
  }
}

