import 'package:json_annotation/json_annotation.dart';
import 'package:movies_test/models/BelongsToCollection.dart';
import 'package:movies_test/models/Genre.dart';
import 'package:movies_test/models/ProductionCompany.dart';
import 'package:movies_test/models/ProductionCountry.dart';
import 'package:movies_test/models/SpokenLanguage.dart';

part 'Movie.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class Movie {
  bool adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  num? budget;
  List<Genre>? genres;
  String? homepage;
  int id;
  String? imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  num popularity;
  String posterPath;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  String releaseDate;
  num? revenue;
  num? runtime;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String title;
  bool video;
  num voteAverage;
  num voteCount;

  Movie(
      this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  String get backdropUrl => 'https://image.tmdb.org/t/p/w500$backdropPath';
  String get posterUrl => 'https://image.tmdb.org/t/p/w200$posterPath';
}




