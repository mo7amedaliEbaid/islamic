import 'dart:convert';

import '../../../app/utils/functions.dart';
import '../../responses/adhkar/adhkar_response.dart';
import '../../responses/hadith/hadith_response.dart';
import '../../responses/quran/quran_response.dart';
import '../../responses/quran/quran_search_response.dart';


const String quranPath = "assets/json/quran.json";
const String simpleQuranPath = "assets/json/simple_quran.json";
const String hadithPath = "assets/json/40_hadith_nawawi.json";
const String adhkarPath = "assets/json/adhkar.json";

abstract class LocalDataSource {
  Future<List<QuranResponse>> getQuranData();

  Future<List<QuranSearchResponse>> getQuranSearchData();

  Future<List<HadithResponse>> getHadithData();

  Future<List<AdhkarResponse>> getAdhkarData();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<List<AdhkarResponse>> getAdhkarData() async {
    final jsonString = await fetchDataFromJson(adhkarPath);
    final data = jsonDecode(jsonString);
    // return data;
    return List<AdhkarResponse>.from(
        (data as List).map((e) => AdhkarResponse.fromJson(e)));
  }

  @override
  Future<List<HadithResponse>> getHadithData() async {
    final jsonString = await fetchDataFromJson(hadithPath);
    final data = jsonDecode(jsonString);
    return List<HadithResponse>.from(
        (data as List).map((e) => HadithResponse.fromJson(e)));
  }

  @override
  Future<List<QuranResponse>> getQuranData() async {
    final jsonString = await fetchDataFromJson(quranPath);
    final data = jsonDecode(jsonString);
    return List<QuranResponse>.from(
        (data as List).map((e) => QuranResponse.fromJson(e)));
  }

  @override
  Future<List<QuranSearchResponse>> getQuranSearchData() async {
    final jsonString = await fetchDataFromJson(simpleQuranPath);
    final data = jsonDecode(jsonString);
    return List<QuranSearchResponse>.from(
        (data as List).map((e) => QuranSearchResponse.fromJson(e)));
  }
}
