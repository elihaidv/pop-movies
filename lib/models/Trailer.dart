import 'package:json_annotation/json_annotation.dart';

part 'Trailer.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class Trailer {
  final String name;
  final String size;
  final String source;
  final String type;

  Trailer(this.name, this.size, this.source, this.type);


  factory Trailer.fromJson(Map<String, dynamic> json) => _$TrailerFromJson(json);
  Map<String, dynamic> toJson() => _$TrailerToJson(this);

  String get youtubeUrl => 'https://www.youtube.com/watch?v=$source';

  String get thumbnailUrl => 'https://img.youtube.com/vi/$source/0.jpg';
}

@JsonSerializable(fieldRename:FieldRename.snake)
class TrailersList {
  final List<Trailer> youtube;
  final List<Trailer> quicktime;
  final num id;

  TrailersList(this.youtube, this.quicktime, this.id);

  factory TrailersList.fromJson(Map<String, dynamic> json) => _$TrailersListFromJson(json);
  Map<String, dynamic> toJson() => _$TrailersListToJson(this);
}