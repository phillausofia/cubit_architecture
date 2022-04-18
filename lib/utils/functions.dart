String buildPosterUrl(String posterPath) => Uri.https(
  'image.tmdb.org',
  't/p/w500' + posterPath,
  {'apiKey': '51c33d10ebc31ef012b00c9b8d05b2de'},
).toString();