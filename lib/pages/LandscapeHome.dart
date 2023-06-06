import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/data/MovieStates.dart';
import 'package:movies_test/data/MoviesCubit.dart';
import 'package:movies_test/models/Movie.dart';
import 'package:movies_test/widgets/MovieDetails.dart';
import 'package:movies_test/widgets/MoviesGrid.dart';

class LandscapeHome extends StatelessWidget {
  const LandscapeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pop Movies'),
        ),
        body: Row(children: [
          Expanded(
              flex: 1,
              child: BlocBuilder<MoviesCubit, MoviesState>(
                  builder: (BuildContext context, MoviesState movieState) =>
                      movieState is MoviesLoaded
                          ? MoviesGrid(movieState.movies, (Movie movie) {
                              context
                                  .read<SelectedMovieCubit>()
                                  .selectMovie(movie);
                              context.read<TrailersCubit>().loadTrailers();
                            })
                          : const Center(child: CircularProgressIndicator()))),
          SizedBox(width: 10),
          BlocBuilder<SelectedMovieCubit, Movie?>(
            builder: (BuildContext context, Movie? movie) => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: movie == null ? 0 : MediaQuery.of(context).size.width / 2,
                child: movie == null ? Container() : MovieDetails(movie)),
          )
        ]));
  }
}
