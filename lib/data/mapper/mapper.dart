

import 'package:islamic/app/utils/extensions.dart';

import '../../app/utils/constants.dart';
import '../../domain/models/adhkar/adhkar_model.dart';
import '../../domain/models/hadith/hadith_model.dart';
import '../../domain/models/prayer_timings/prayer_timings_model.dart';
import '../../domain/models/quran/quran_model.dart';
import '../../domain/models/quran/quran_search_model.dart';
import '../responses/adhkar/adhkar_response.dart';
import '../responses/hadith/hadith_response.dart';
import '../responses/prayer_timings/prayer_timings_response.dart';
import '../responses/quran/quran_response.dart';
import '../responses/quran/quran_search_response.dart';

extension AyahResponseMapper on AyahResponse {
  AyahModel toDomain() {
    return AyahModel(
      number: number.orZero(),
      text: text.orEmpty(),
      numberInSurah: numberInSurah.orZero(),
      juz: juz.orZero(),
      page: page.orZero(),
      hizbQuarter: hizbQuarter.orZero(),
    );
  }
}

extension QuranSearchResponseMapper on QuranSearchResponse {
  QuranSearchModel toDomain() {
    return QuranSearchModel(
      id: id.orZero(),
      text: text.orEmpty(),
      numberInSurah: int.parse(verseKey.split(":")[1]).orZero(),
      surahNumber: int.parse(verseKey.split(":")[0]).orZero(),
    );
  }
}

extension QuranResponseMapper on QuranResponse {
  QuranModel toDomain() {
    List<AyahModel> ayahs =
        (this.ayahs.map((ayahResponse) => ayahResponse.toDomain()))
            .cast<AyahModel>()
            .toList();
    return QuranModel(
      number: number.orZero(),
      name: name.orEmpty(),
      englishName: englishName.orEmpty(),
      englishNameTranslation: englishNameTranslation.orEmpty(),
      revelationType: revelationType.orEmpty(),
      ayahs: ayahs,
    );
  }
}

extension HadithResponseMapper on HadithResponse {
  HadithModel toDomain() {
    return HadithModel(
        description: description.orEmpty(), hadith: hadith.orEmpty());
  }
}

extension AdhkarResponseMapper on AdhkarResponse {
  AdhkarModel toDomain() {
    return AdhkarModel(
      category: category.orEmpty(),
      count: count.orEmpty(),
      description: description.orEmpty(),
      reference: reference.orEmpty(),
      dhikr: dhikr.orEmpty(),
    );
  }
}

extension WeekdayResponseMapper on WeekdayResponse? {
  WeekdayModel toDomain() {
    return WeekdayModel(
      en: this?.en.orEmpty() ?? Constants.empty,
      ar: this?.ar.orEmpty() ?? Constants.empty,
    );
  }
}

extension MonthResponseMapper on MonthResponse? {
  MonthModel toDomain() {
    return MonthModel(
      number: this?.number.orZero() ?? Constants.zero,
      en: this?.en.orEmpty() ?? Constants.empty,
      ar: this?.ar.orEmpty() ?? Constants.empty,
    );
  }
}

extension HijriResponseMapper on HijriResponse? {
  HijriModel toDomain() {
    return HijriModel(
      date: this?.date.orEmpty() ?? Constants.empty,
      format: this?.format.orEmpty() ?? Constants.empty,
      day: this?.day.orEmpty() ?? Constants.empty,
      weekday: this?.weekday.toDomain(),
      month: this?.month.toDomain(),
      year: this?.year.orEmpty() ?? Constants.empty,
    );
  }
}

extension GregorianResponseMapper on GregorianResponse? {
  GregorianModel toDomain() {
    return GregorianModel(
      date: this?.date.orEmpty() ?? Constants.empty,
      format: this?.format.orEmpty() ?? Constants.empty,
      day: this?.day.orEmpty() ?? Constants.empty,
      weekday: this?.weekday.toDomain(),
      month: this?.month.toDomain(),
      year: this?.year.orEmpty() ?? Constants.empty,
    );
  }
}

extension TimingsResponseMapper on TimingsResponse? {
  TimingsModel toDomain() {
    return TimingsModel(
      fajr: this?.fajr.orEmpty() ?? Constants.empty,
      sunrise: this?.sunrise.orEmpty() ?? Constants.empty,
      dhuhr: this?.dhuhr.orEmpty() ?? Constants.empty,
      asr: this?.asr.orEmpty() ?? Constants.empty,
      maghrib: this?.maghrib.orEmpty() ?? Constants.empty,
      isha: this?.isha.orEmpty() ?? Constants.empty,
    );
  }
}

extension DateResponseMapper on DateResponse? {
  DateModel toDomain() {
    return DateModel(
      readable: this?.readable.orEmpty() ?? Constants.empty,
      timestamp: this?.readable.orEmpty() ?? Constants.empty,
      hijri: this?.hijri.toDomain(),
      gregorian: this?.gregorian.toDomain(),
    );
  }
}

extension PrayerTimingsDataResponseMapper on PrayerTimingsDataResponse? {
  PrayerTimingsDataModel toDomain() {
    return PrayerTimingsDataModel(
      timings: this?.timings.toDomain(),
      date: this?.date.toDomain(),
    );
  }
}

extension PrayerTimingsResponseMapper on PrayerTimingsResponse? {
  PrayerTimingsModel toDomain() {
    return PrayerTimingsModel(
      code: this?.code.orZero() ?? Constants.zero,
      status: this?.status.orEmpty() ?? Constants.empty,
      data: this?.data.toDomain(),
    );
  }
}
