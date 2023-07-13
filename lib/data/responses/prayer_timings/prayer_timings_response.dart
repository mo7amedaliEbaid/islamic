import 'package:json_annotation/json_annotation.dart';

import '../base_respopnse/base_response.dart';

part 'prayer_timings_response.g.dart';

@JsonSerializable()
class WeekdayResponse {
  @JsonKey(name: "en")
  String? en;
  @JsonKey(name: "ar")
  String? ar;

  WeekdayResponse(
    this.en,
    this.ar,
  );

  //from Json
  factory WeekdayResponse.fromJson(Map<String, dynamic> json) =>
      _$WeekdayResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$WeekdayResponseToJson(this);
}

@JsonSerializable()
class MonthResponse {
  @JsonKey(name: "number")
  int? number;
  @JsonKey(name: "en")
  String? en;
  @JsonKey(name: "ar")
  String? ar;

  MonthResponse(
    this.number,
    this.en,
    this.ar,
  );

  //from Json
  factory MonthResponse.fromJson(Map<String, dynamic> json) =>
      _$MonthResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$MonthResponseToJson(this);
}

@JsonSerializable()
class HijriResponse {
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "format")
  String? format;
  @JsonKey(name: "day")
  String? day;
  @JsonKey(name: "weekday")
  WeekdayResponse? weekday;
  @JsonKey(name: "month")
  MonthResponse? month;
  @JsonKey(name: "year")
  String? year;

  HijriResponse(
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
  );

  //from Json
  factory HijriResponse.fromJson(Map<String, dynamic> json) =>
      _$HijriResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$HijriResponseToJson(this);
}

@JsonSerializable()
class GregorianResponse {
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "format")
  String? format;
  @JsonKey(name: "day")
  String? day;
  @JsonKey(name: "weekday")
  WeekdayResponse? weekday;
  @JsonKey(name: "month")
  MonthResponse? month;
  @JsonKey(name: "year")
  String? year;

  GregorianResponse(
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
  );

  //from Json
  factory GregorianResponse.fromJson(Map<String, dynamic> json) =>
      _$GregorianResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$GregorianResponseToJson(this);
}

@JsonSerializable()
class TimingsResponse {
  @JsonKey(name: "Fajr")
  String? fajr;
  @JsonKey(name: "Sunrise")
  String? sunrise;
  @JsonKey(name: "Dhuhr")
  String? dhuhr;
  @JsonKey(name: "Asr")
  String? asr;
  @JsonKey(name: "Maghrib")
  String? maghrib;
  @JsonKey(name: "Isha")
  String? isha;

  TimingsResponse(
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  );

  //from Json
  factory TimingsResponse.fromJson(Map<String, dynamic> json) =>
      _$TimingsResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$TimingsResponseToJson(this);
}

@JsonSerializable()
class DateResponse {
  @JsonKey(name: "readable")
  String? readable;
  @JsonKey(name: "timestamp")
  String? timestamp;
  @JsonKey(name: "hijri")
  HijriResponse? hijri;
  @JsonKey(name: "gregorian")
  GregorianResponse? gregorian;

  DateResponse(
    this.readable,
    this.timestamp,
    this.hijri,
    this.gregorian,
  );

  //from Json
  factory DateResponse.fromJson(Map<String, dynamic> json) =>
      _$DateResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$DateResponseToJson(this);
}

@JsonSerializable()
class PrayerTimingsDataResponse {
  @JsonKey(name: "timings")
  TimingsResponse? timings;
  @JsonKey(name: "date")
  DateResponse? date;

  PrayerTimingsDataResponse(
    this.timings,
    this.date,
  );

  //from Json
  factory PrayerTimingsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimingsDataResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$PrayerTimingsDataResponseToJson(this);
}

@JsonSerializable()
class PrayerTimingsResponse extends BaseResponse {
  @JsonKey(name: "data")
  PrayerTimingsDataResponse? data;

  PrayerTimingsResponse(
    this.data,
  );

  //from Json
  factory PrayerTimingsResponse.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimingsResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$PrayerTimingsResponseToJson(this);
}
