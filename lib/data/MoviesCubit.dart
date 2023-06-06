
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/data/MovieStates.dart';
import 'package:movies_test/data/MoviesRepository.dart';
import 'package:movies_test/models/Movie.dart';
import 'package:movies_test/models/Trailer.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(): super(MoviesLoading());
  final MoviesRepository _moviesRepository = MoviesRepository.instance;

  void loadNext() async {
    await _moviesRepository.loadNextMovies();
    emit(MoviesLoaded(_moviesRepository.movies));
  }

}

class SelectedMovieCubit extends Cubit<Movie?> {
  SelectedMovieCubit(): super(null);
  final MoviesRepository _moviesRepository = MoviesRepository.instance;

  void selectMovie(Movie? movie) async {
    emit(movie);
    if (movie == null) return;
    await _moviesRepository.selectMovie(movie);
    emit(_moviesRepository.currentMovie);


  }
}

class TrailersCubit extends Cubit<List<Trailer>> {
  TrailersCubit(): super([]);
  final MoviesRepository _moviesRepository = MoviesRepository.instance;

  void loadTrailers() async {
    emit([]);
    await _moviesRepository.loadTrailers();
    emit(_moviesRepository.trailers);
  }
}

