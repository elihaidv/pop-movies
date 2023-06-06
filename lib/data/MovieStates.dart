
import 'package:movies_test/models/Movie.dart';

abstract class MoviesState{}

class MoviesLoading extends MoviesState{}

class MoviesLoaded extends MoviesState{
  final List<Movie> movies;
  MoviesLoaded(this.movies);
}

class MoviesError extends MoviesState{
  final String message;
  MoviesError(this.message);
}
