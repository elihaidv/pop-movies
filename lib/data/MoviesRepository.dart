import 'package:movies_test/data/RestClient.dart';
import 'package:movies_test/models/Movie.dart';
import 'package:movies_test/models/MoviesList.dart';
import 'package:movies_test/models/Trailer.dart';

class MoviesRepository {
  static final MoviesRepository instance = MoviesRepository();
  final List<Movie> movies = [];
  Movie? currentMovie;
  int page = 1;
  List<Trailer> trailers = [];

  Future<void> loadNextMovies() async {
    page++;
    final MoviesList moviesList = await RestClient.instance.getPopularMovies(page);
    movies.addAll(moviesList.movies);
  }

  selectMovie(Movie movie) async {
    currentMovie = movie;

    // Load more details
    currentMovie = await RestClient.instance.getMovie(movie.id);
  }

  loadTrailers() async {
    final TrailersList trailersList = await RestClient.instance.getTrailers(currentMovie!.id);
    trailers = trailersList.youtube;
  }
}