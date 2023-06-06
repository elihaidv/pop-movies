
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/Trailer.dart';

class TrailersListWidget extends StatelessWidget {
  final List<Trailer> trailers;
  const TrailersListWidget(this.trailers, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final Trailer trailer = trailers[index];
          return InkWell(
              onTap: () => launchUrlString(trailer.youtubeUrl,
                  mode: LaunchMode.externalApplication),
              child: ListTile(
                  leading: const Icon(Icons.play_circle, color: Colors.red),
                  title: Text(trailer.name),
                  trailing: Container(
                      width: 100,
                      padding: const EdgeInsets.all(5),
                      child: CachedNetworkImage(
                        imageUrl: trailer.thumbnailUrl,
                        fit: BoxFit.cover,
                      ))));
        },
        childCount: trailers.length ?? 0,
      ));
}
