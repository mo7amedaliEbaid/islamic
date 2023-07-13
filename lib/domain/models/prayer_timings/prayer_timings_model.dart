import 'package:equatable/equatable.dart';

class WeekdayModel extends Equatable {
  final String en;
  final String ar;

  const WeekdayModel({
    required this.en,
    required this.ar,
  });

  @override
  List<Object> get props => [
        en,
        ar,
      ];
}

class MonthModel extends Equatable {
  final int number;
  final String en;
  final String ar;

  const MonthModel({
    required this.number,
    required this.en,
    required this.ar,
  });

  @override
  List<Object> get props => [
        number,
        en,
        ar,
      ];
}

class HijriModel extends Equatable {
  final String date;
  final String format;
  final String day;
  final WeekdayModel? weekday;
  final MonthModel? month;
  final String year;

  const HijriModel({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
  });

  @override
  List<Object?> get props => [
        date,
        format,
        day,
        weekday,
        month,
        year,
      ];
}

class GregorianModel extends Equatable {
  final String date;
  final String format;
  final String day;
  final WeekdayModel? weekday;
  final MonthModel? month;
  final String year;

  const GregorianModel({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
  });

  @override
  List<Object?> get props => [
        date,
        format,
        day,
        weekday,
        month,
        year,
      ];
}

class TimingsModel extends Equatable {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  const TimingsModel({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  @override
  List<Object> get props => [
        fajr,
        sunrise,
        dhuhr,
        asr,
        maghrib,
        isha,
      ];
}

class DateModel extends Equatable {
  final String readable;
  final String timestamp;
  final HijriModel? hijri;
  final GregorianModel? gregorian;

  const DateModel({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  @override
  List<Object?> get props => [
        readable,
        timestamp,
        hijri,
        gregorian,
      ];
}

class PrayerTimingsDataModel extends Equatable {
  final TimingsModel? timings;
  final DateModel? date;

  const PrayerTimingsDataModel({
    required this.timings,
    required this.date,
  });

  @override
  List<Object?> get props => [
        timings,
        date,
      ];
}

class PrayerTimingsModel extends Equatable {
  final int code;
  final String status;
  final PrayerTimingsDataModel? data;

  const PrayerTimingsModel({
    required this.code,
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => [
        code,
        status,
        data,
      ];
}
