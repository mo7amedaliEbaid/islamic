// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adhkar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdhkarResponse _$AdhkarResponseFromJson(Map<String, dynamic> json) =>
    AdhkarResponse(
      json['category'] as String,
      json['count'] as String,
      json['description'] as String,
      json['reference'] as String,
      json['dhikr'] as String,
    );

Map<String, dynamic> _$AdhkarResponseToJson(AdhkarResponse instance) =>
    <String, dynamic>{
      'category': instance.category,
      'count': instance.count,
      'description': instance.description,
      'reference': instance.reference,
      'dhikr': instance.dhikr,
    };
