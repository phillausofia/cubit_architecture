class MoviePopularDTO {

  final String? posterPath;
  final String? title;
  final int? id;

  MoviePopularDTO({
    required this.posterPath,
    required this.title,
    required this.id,
});

  factory MoviePopularDTO.fromMap(Map<String, dynamic> map) {
    return MoviePopularDTO(
      posterPath: map['poster_path'],
      title: map['title'],
      id: map['id'],
    );
  }
}