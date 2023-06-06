import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/data/MoviesCubit.dart';
import 'package:movies_test/data/RestClient.dart';
import 'package:movies_test/models/Movie.dart';
import 'package:movies_test/models/Trailer.dart';
import 'package:movies_test/widgets/MovieDetails.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MovieDetailsPage extends StatelessWidget {
  static const routeName = '/movieDetails';

  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    context.read<SelectedMovieCubit>().selectMovie(movie);
    context.read<TrailersCubit>().loadTrailers();

    return Scaffold(
        body: BlocBuilder<SelectedMovieCubit, Movie?>(
            builder: (BuildContext context, Movie? movie) => movie == null
                ? const Center(child: Text('Movie not found'))
                : MovieDetails(movie)));
  }
}
