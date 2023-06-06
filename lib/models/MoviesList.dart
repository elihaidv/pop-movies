import 'package:json_annotation/json_annotation.dart';
import 'package:movies_test/models/Movie.dart';

part 'MoviesList.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class MoviesList {
  int page;
  int totalResults;
  int totalPages;

  @JsonKey(name:'results')
  final List<Movie> movies;

  MoviesList(this.page, this.movies, this.totalResults, this.totalPages);

  factory MoviesList.fromJson(Map<String, dynamic> json) => _$MoviesListFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesListToJson(this);


}