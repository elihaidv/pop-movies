import 'package:json_annotation/json_annotation.dart';

part 'ProductionCountry.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class ProductionCountry {
  ProductionCountry(
      this.iso31661,
      this.name);

  @JsonKey(name:'iso_3166_1')
  String iso31661;
  String name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);

}