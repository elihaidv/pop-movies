
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/data/MoviesCubit.dart';
import 'package:movies_test/data/RestClient.dart';
import 'package:movies_test/models/Movie.dart';
import 'package:movies_test/models/MoviesList.dart';
import 'package:movies_test/widgets/MovieItem.dart';


class MoviesGrid extends StatelessWidget {

  final List<Movie> movies;
  final onMovieSelected;
  int page = 1;

  MoviesGrid(this.movies, this.onMovieSelected, {super.key});


  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent * 0.8) {
        context.read<MoviesCubit>().loadNext();
      }
    });

    return GridView.builder(
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:300,
        childAspectRatio: 0.7,
      ),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
          onMovieSelected(movies[index]);
        },
        child:MovieItem(movies[index], key: ValueKey(movies[index].id)));
      },
    );
  }

}
