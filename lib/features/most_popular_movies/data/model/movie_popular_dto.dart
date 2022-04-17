class MoviePopularDTO {

  final String? posterPath;
  final String? title;

  MoviePopularDTO({
    required this.posterPath,
    required this.title,
});

  factory MoviePopularDTO.fromMap(Map<String, dynamic> map) {
    return MoviePopularDTO(
      posterPath: map['poster_path'],
      title: map['title'],
    );
  }
}