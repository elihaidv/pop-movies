import 'package:json_annotation/json_annotation.dart';

part 'Genre.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class Genre {
  Genre(
      this.id,
      this.name,);

  num id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);


}