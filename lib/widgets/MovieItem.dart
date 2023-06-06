
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_test/models/Movie.dart';

class MovieItem extends StatelessWidget {
  Movie movie;
  MovieItem(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: movie.posterUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
            child: SizedBox.square(
                dimension: 100, child: CircularProgressIndicator())),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
}
