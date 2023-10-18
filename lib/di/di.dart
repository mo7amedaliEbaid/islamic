import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/local/local_data_source.dart';
import '../data/data_source/remote/remote_data_source.dart';
import '../data/database/database.dart';
import '../data/network/dio_factroy.dart';
import '../data/network/network_info.dart';
import '../data/network/prayer_timings_api.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/adhkar_usecase.dart';
import '../domain/usecase/del_all_custom_adhkar_usecase.dart';
import '../domain/usecase/del_custom_dhikr_by_id_usecase.dart';
import '../domain/usecase/get_all_custom_adhkar_usecase.dart';
import '../domain/usecase/get_custom_dhikr_by_id_usecase.dart';
import '../domain/usecase/get_prayer_timings_usecase.dart';
import '../domain/usecase/hadith_usecase.dart';
import '../domain/usecase/insert_new_dhikr_usecase.dart';
import '../domain/usecase/quran_search_usecase.dart';
import '../domain/usecase/quran_usecase.dart';
import '../domain/usecase/update_custom_dhikr.dart';
import '../presentation/custom_adhkar/cubit/custom_adhkar_cubit.dart';
import '../presentation/home/cubit/home_cubit.dart';
import '../presentation/home/screens/adhkar/cubit/adhkar_cubit.dart';
import '../presentation/home/screens/hadith/cubit/hadith_cubit.dart';
import '../presentation/home/screens/prayer_times/cubit/prayer_timings_cubit.dart';
import '../presentation/home/screens/quran/cubit/quran_cubit.dart';
import '../presentation/home/viewmodel/home_viewmodel.dart';
import '../app/utils/app_prefs.dart';

final instance = GetIt.instance;

Future initAppModule() async {

  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance.registerLazySingleton<AppPreferences>(() => AppPreferences());

  instance.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<PrayerTimingsServiceClient>(
      () => PrayerTimingsServiceClient(dio));

  instance
      .registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  instance.registerLazySingleton<AppDatabase>(() => database);

  instance.registerFactory<HomeCubit>(() => HomeCubit());
  instance.registerFactory<QuranCubit>(() => QuranCubit());
  instance.registerFactory<HadithCubit>(() => HadithCubit());
  instance.registerFactory<PrayerTimingsCubit>(() => PrayerTimingsCubit());
  instance.registerFactory<AdhkarCubit>(() => AdhkarCubit());
  instance.registerFactory<CustomAdhkarCubit>(() => CustomAdhkarCubit());

  instance.registerLazySingleton<Repository>(() => RepositoryImpl());

  instance.registerFactory<PageController>(() => PageController());

  instance
      .registerFactory<TextEditingController>(() => TextEditingController());

  instance.registerFactory<GlobalKey<FormState>>(() => GlobalKey<FormState>());

  instance.registerFactory<GlobalKey<ScaffoldState>>(
      () => GlobalKey<ScaffoldState>());

  instance.registerFactory<SearchController>(() => SearchController());
}

void initQuranModule() {
  if (!GetIt.I.isRegistered<QuranUseCase>()) {
    instance.registerFactory<QuranUseCase>(() => QuranUseCase());
    instance.registerFactory<QuranSearchUseCase>(() => QuranSearchUseCase());
    instance.registerFactory<HomeViewModel>(() => HomeViewModel());
  }
}

void initHadithModule() {
  if (!GetIt.I.isRegistered<HadithUseCase>()) {
    instance.registerFactory<HadithUseCase>(() => HadithUseCase());
  }
}

void initAdhkarModule() {
  if (!GetIt.I.isRegistered<AdhkarUseCase>()) {
    instance.registerFactory<AdhkarUseCase>(() => AdhkarUseCase());
  }
}

void initPrayerTimingsModule() {
  if (!GetIt.I.isRegistered<GetPrayerTimingsUseCase>()) {
    instance.registerFactory<GetPrayerTimingsUseCase>(
        () => GetPrayerTimingsUseCase());
  }
}

void initCustomAdhkarModule() {
  if (!GetIt.I.isRegistered<GetAllCustomAdhkarUseCase>()) {
    instance.registerFactory<GetAllCustomAdhkarUseCase>(
        () => GetAllCustomAdhkarUseCase());
  }
  if (!GetIt.I.isRegistered<GetCustomDhikrByIdUseCase>()) {
    instance.registerFactory<GetCustomDhikrByIdUseCase>(
        () => GetCustomDhikrByIdUseCase());
  }
  if (!GetIt.I.isRegistered<InsertNewDhikrUseCase>()) {
    instance
        .registerFactory<InsertNewDhikrUseCase>(() => InsertNewDhikrUseCase());
  }
  if (!GetIt.I.isRegistered<UpdateCustomDhikrUseCase>()) {
    instance.registerFactory<UpdateCustomDhikrUseCase>(
        () => UpdateCustomDhikrUseCase());
  }
  if (!GetIt.I.isRegistered<DelCustomDhikrByDhikrTextUseCase>()) {
    instance.registerFactory<DelCustomDhikrByDhikrTextUseCase>(
        () => DelCustomDhikrByDhikrTextUseCase());
  }
  if (!GetIt.I.isRegistered<DelAllCustomAdhkarUseCase>()) {
    instance.registerFactory<DelAllCustomAdhkarUseCase>(
        () => DelAllCustomAdhkarUseCase());
  }
}
