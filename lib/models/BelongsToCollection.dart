import 'package:json_annotation/json_annotation.dart';

part 'BelongsToCollection.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class BelongsToCollection {
  BelongsToCollection(
      this.id,
      this.name,
      this.posterPath,
      this.backdropPath);

  num id;
  String name;
  String? posterPath;
  String? backdropPath;

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) => _$BelongsToCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);


}