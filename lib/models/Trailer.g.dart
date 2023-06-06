// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Trailer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
      json['name'] as String,
      json['size'] as String,
      json['source'] as String,
      json['type'] as String,
    );

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'source': instance.source,
      'type': instance.type,
    };

TrailersList _$TrailersListFromJson(Map<String, dynamic> json) => TrailersList(
      (json['youtube'] as List<dynamic>)
          .map((e) => Trailer.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['quicktime'] as List<dynamic>)
          .map((e) => Trailer.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as num,
    );

Map<String, dynamic> _$TrailersListToJson(TrailersList instance) =>
    <String, dynamic>{
      'youtube': instance.youtube,
      'quicktime': instance.quicktime,
      'id': instance.id,
    };
