import 'package:json_annotation/json_annotation.dart';

part 'SpokenLanguage.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class SpokenLanguage {
  SpokenLanguage(
      this.englishName,
      this.iso6391,
      this.name);


  String englishName;
  @JsonKey(name:'iso_639_1')
  String iso6391;
  String name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);


}