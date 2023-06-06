import 'package:json_annotation/json_annotation.dart';

part 'ProductionCompany.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class ProductionCompany {
  ProductionCompany(
      this.id,
      this.logoPath,
      this.name,
      this.originCountry);

  num id;
  String? logoPath;
  String? name;
  String? originCountry;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);

}