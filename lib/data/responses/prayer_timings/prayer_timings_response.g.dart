// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_timings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeekdayResponse _$WeekdayResponseFromJson(Map<String, dynamic> json) =>
    WeekdayResponse(
      json['en'] as String?,
      json['ar'] as String?,
    );

Map<String, dynamic> _$WeekdayResponseToJson(WeekdayResponse instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };

MonthResponse _$MonthResponseFromJson(Map<String, dynamic> json) =>
    MonthResponse(
      json['number'] as int?,
      json['en'] as String?,
      json['ar'] as String?,
    );

Map<String, dynamic> _$MonthResponseToJson(MonthResponse instance) =>
    <String, dynamic>{
      'number': instance.number,
      'en': instance.en,
      'ar': instance.ar,
    };

HijriResponse _$HijriResponseFromJson(Map<String, dynamic> json) =>
    HijriResponse(
      json['date'] as String?,
      json['format'] as String?,
      json['day'] as String?,
      json['weekday'] == null
          ? null
          : WeekdayResponse.fromJson(json['weekday'] as Map<String, dynamic>),
      json['month'] == null
          ? null
          : MonthResponse.fromJson(json['month'] as Map<String, dynamic>),
      json['year'] as String?,
    );

Map<String, dynamic> _$HijriResponseToJson(HijriResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'day': instance.day,
      'weekday': instance.weekday,
      'month': instance.month,
      'year': instance.year,
    };

GregorianResponse _$GregorianResponseFromJson(Map<String, dynamic> json) =>
    GregorianResponse(
      json['date'] as String?,
      json['format'] as String?,
      json['day'] as String?,
      json['weekday'] == null
          ? null
          : WeekdayResponse.fromJson(json['weekday'] as Map<String, dynamic>),
      json['month'] == null
          ? null
          : MonthResponse.fromJson(json['month'] as Map<String, dynamic>),
      json['year'] as String?,
    );

Map<String, dynamic> _$GregorianResponseToJson(GregorianResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'day': instance.day,
      'weekday': instance.weekday,
      'month': instance.month,
      'year': instance.year,
    };

TimingsResponse _$TimingsResponseFromJson(Map<String, dynamic> json) =>
    TimingsResponse(
      json['Fajr'] as String?,
      json['Sunrise'] as String?,
      json['Dhuhr'] as String?,
      json['Asr'] as String?,
      json['Maghrib'] as String?,
      json['Isha'] as String?,
    );

Map<String, dynamic> _$TimingsResponseToJson(TimingsResponse instance) =>
    <String, dynamic>{
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Maghrib': instance.maghrib,
      'Isha': instance.isha,
    };

DateResponse _$DateResponseFromJson(Map<String, dynamic> json) => DateResponse(
      json['readable'] as String?,
      json['timestamp'] as String?,
      json['hijri'] == null
          ? null
          : HijriResponse.fromJson(json['hijri'] as Map<String, dynamic>),
      json['gregorian'] == null
          ? null
          : GregorianResponse.fromJson(
              json['gregorian'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DateResponseToJson(DateResponse instance) =>
    <String, dynamic>{
      'readable': instance.readable,
      'timestamp': instance.timestamp,
      'hijri': instance.hijri,
      'gregorian': instance.gregorian,
    };

PrayerTimingsDataResponse _$PrayerTimingsDataResponseFromJson(
        Map<String, dynamic> json) =>
    PrayerTimingsDataResponse(
      json['timings'] == null
          ? null
          : TimingsResponse.fromJson(json['timings'] as Map<String, dynamic>),
      json['date'] == null
          ? null
          : DateResponse.fromJson(json['date'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrayerTimingsDataResponseToJson(
        PrayerTimingsDataResponse instance) =>
    <String, dynamic>{
      'timings': instance.timings,
      'date': instance.date,
    };

PrayerTimingsResponse _$PrayerTimingsResponseFromJson(
        Map<String, dynamic> json) =>
    PrayerTimingsResponse(
      json['data'] == null
          ? null
          : PrayerTimingsDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..status = json['status'] as String?;

Map<String, dynamic> _$PrayerTimingsResponseToJson(
        PrayerTimingsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
