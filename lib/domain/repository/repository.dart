import 'package:dartz/dartz.dart';


import '../../app/error/failure.dart';
import '../models/adhkar/adhkar_model.dart';
import '../models/adhkar/custom_adhkar_model.dart';
import '../models/hadith/hadith_model.dart';
import '../models/prayer_timings/prayer_timings_model.dart';
import '../models/quran/quran_model.dart';
import '../models/quran/quran_search_model.dart';

abstract class Repository {
  Future<Either<Failure, List<QuranModel>>> getQuranData();

  Future<Either<Failure, List<QuranSearchModel>>> getQuranSearchData();

  Future<Either<Failure, List<HadithModel>>> getHadithData();

  Future<Either<Failure, List<AdhkarModel>>> getAdhkarData();

  Future<Either<Failure, PrayerTimingsModel>> getPrayerTimings(
    String date,
    String city,
    String country,
  );


  //Database
  Future<Either<Failure, List<CustomAdhkarEntity>>> getAllCustomAdhkar();

  Future<Either<Failure, CustomAdhkarEntity?>> getDhikrByDhikrText(
      String dhikr);

  Future<Either<Failure, void>> insertDhikr(CustomAdhkarEntity dhikr);

  Future<Either<Failure, void>> updateDhikr(CustomAdhkarEntity dhikr);

  Future<Either<Failure, void>> delDhikrByDhikrText(String dhikr);

  Future<Either<Failure, void>> deleteAll(List<CustomAdhkarEntity> list);
}
