import 'package:tmdb_app/models/movie_model.dart';

class Favorites {
  List<MovieModel> favoriteMovies = [];

  void addFavorite(MovieModel movie) {
    favoriteMovies.add(movie);
  }

  void removeFavorite(MovieModel movie) {
    favoriteMovies.remove(movie);
  }
}