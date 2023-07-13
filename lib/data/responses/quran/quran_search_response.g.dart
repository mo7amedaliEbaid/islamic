// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranSearchResponse _$QuranSearchResponseFromJson(Map<String, dynamic> json) =>
    QuranSearchResponse(
      json['id'] as int,
      json['text_imlaei_simple'] as String,
      json['verse_key'] as String,
    );

Map<String, dynamic> _$QuranSearchResponseToJson(
        QuranSearchResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text_imlaei_simple': instance.text,
      'verse_key': instance.verseKey,
    };
