import 'dart:io';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movies_test/keys.dart';
import 'package:movies_test/models/Movie.dart';
import 'package:movies_test/models/MoviesList.dart';
import 'package:movies_test/models/Trailer.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

part 'RestClient.g.dart';


@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class RestClient {
  static late RestClient instance;

  static init() async {
    var cachePath = "";
    if (!kIsWeb) {
      var cacheDir = await getTemporaryDirectory();
      cachePath = cacheDir.path;
    } else {
      var cacheDir = "movies";
    }

      var customCacheOptions = CacheOptions(
        store: HiveCacheStore(
          cachePath,
          hiveBoxName: "movies",
        ),
        policy: CachePolicy.forceCache,
        priority: CachePriority.high,
        maxStale: const Duration(minutes: 5),
        hitCacheOnErrorExcept: [401, 404],
        keyBuilder: (request) {
          return request.uri.toString();
        },
        allowPostMethod: false,
      );


    instance = RestClient(Dio()
      ..interceptors.add(LogInterceptor(responseBody: true))
      ..interceptors.add(DioCacheInterceptor(options: customCacheOptions))
      ..options.headers["Authorization"] = "Bearer $accessToken");
  }

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/movie/{id}")
  Future<Movie> getMovie(@Path("id") int id);

  @GET("/movie/popular")
  Future<MoviesList> getPopularMovies(@Query("page") int page);

  @GET("/movie/{id}/trailers")
  Future<TrailersList> getTrailers(@Path("id") int id);
}
