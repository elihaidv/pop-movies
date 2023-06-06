import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/data/MovieStates.dart';
import 'package:movies_test/data/MoviesCubit.dart';
import 'package:movies_test/data/RestClient.dart';
import 'package:movies_test/models/Movie.dart';
import 'package:movies_test/models/MoviesList.dart';
import 'package:movies_test/pages/MovieDetails.dart';
import 'package:movies_test/widgets/MoviesGrid.dart';

class PortraitHome extends StatelessWidget {
  const PortraitHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pop Movies'),
        ),
        body: BlocBuilder<MoviesCubit, MoviesState>(
            builder: (BuildContext context, MoviesState movieState) =>
                movieState is MoviesLoaded
                    ? MoviesGrid(movieState.movies, (Movie movie) {
                        Navigator.pushNamed(context, MovieDetailsPage.routeName,
                            arguments: movie);
                      })
                    : const Center(child: CircularProgressIndicator())));
  }
}
