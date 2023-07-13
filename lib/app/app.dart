import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic/app/utils/app_prefs.dart';
import 'package:islamic/app/utils/di.dart';

import '../presentation/custom_adhkar/cubit/custom_adhkar_cubit.dart';
import '../presentation/home/cubit/home_cubit.dart';
import '../presentation/home/screens/adhkar/cubit/adhkar_cubit.dart';
import '../presentation/home/screens/hadith/cubit/hadith_cubit.dart';
import '../presentation/home/screens/prayer_times/cubit/prayer_timings_cubit.dart';
import '../presentation/home/screens/quran/cubit/quran_cubit.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme.dart';

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  //named constructor
  const MyApp._internal();

  //singleton
  static const MyApp _instance = MyApp._internal();

  //factory
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _preferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _preferences.getAppLocale().then((locale) => context.setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (BuildContext context) => instance<HomeCubit>()
                    ..getLocation()
                    ..isThereABookMarked()),
              BlocProvider(
                  create: (BuildContext context) => instance<QuranCubit>()
                    ..getQuranData()
                    ..getQuranSearchData()),
              BlocProvider(
                  create: (BuildContext context) =>
                      instance<HadithCubit>()..getHadithData()),
              BlocProvider(
                  create: (BuildContext context) =>
                      instance<PrayerTimingsCubit>()
                        ..getPrayerTimings()
                        ..isNetworkConnected()),
              BlocProvider(
                  create: (BuildContext context) =>
                      instance<AdhkarCubit>()..getAdhkarData()),
              BlocProvider(
                  create: (BuildContext context) =>
                      instance<CustomAdhkarCubit>()..getAllCustomAdhkar()),
            ],
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  darkTheme: getApplicationLDarkTheme(),
                  theme: getApplicationLightTheme(),
                  themeMode: _preferences.getAppTheme(),
                  onGenerateRoute: RoutesGenerator.getRoute,
                  initialRoute: Routes.homeRoute,
                );
              },
            ),
          );
        });
  }
}
