import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/data/MoviesCubit.dart';
import 'package:movies_test/models/Movie.dart';
import 'package:movies_test/models/Trailer.dart';
import 'package:movies_test/pages/MovieDetails.dart';
import 'package:movies_test/widgets/TrailersList.dart';

class MovieDetails extends StatelessWidget {
  Movie movie;
  MovieDetails(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              if (!Navigator.of(context).canPop())
                IconButton(
                    onPressed: () =>
                        context.read<SelectedMovieCubit>().selectMovie(null),
                    icon: const Icon(Icons.close))
            ],
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.title),
              background: CachedNetworkImage(
                imageUrl: movie.backdropUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: Text(movie.releaseDate)),
              ListTile(
                leading: const Icon(Icons.description),
                title: Text(movie.overview),
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: Text(movie.voteAverage.toString()),
              ),
              if (movie.genres != null && movie.genres!.isNotEmpty)
                ListTile(
                    leading: const Icon(Icons.movie),
                    title: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: movie.genres!
                              .map((e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Chip(
                                    label: Text(e.name),
                                  )))
                              .toList()),
                    )),
              const Divider(color: Colors.red),
              ListTile(
                title: Text('Trailers:',
                    style: Theme.of(context).textTheme.headline6),
              ),
            ]),
          ),
          BlocBuilder<TrailersCubit, List<Trailer>>(
              builder: (BuildContext context, List<Trailer> trailers) =>
                  TrailersListWidget(trailers))
        ],
      );
}
