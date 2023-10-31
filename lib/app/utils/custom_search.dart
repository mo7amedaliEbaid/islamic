import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/models/quran/quran_model.dart';
import '../../domain/models/quran/quran_search_model.dart';
import '../../presentation/components/separator.dart';
import '../../presentation/home/screens/quran/cubit/quran_cubit.dart';
import '../resources/resources.dart';

import 'app_prefs.dart';
import 'constants.dart';
import '../../di/di.dart';

class CustomSearch extends SearchDelegate<QuranSearchModel?> {
  final AppPreferences _preferences = instance<AppPreferences>();

  bool darkModeOn() {
    final currentThemeMode = _preferences.getAppTheme();
    return currentThemeMode == ThemeMode.dark;
  }

  @override
  TextStyle? get searchFieldStyle {
    return darkModeOn()
        ? getRegularStyle(fontSize: FontSize.s14)
        : getRegularStyle(fontSize: FontSize.s14, color: ColorManager.black);
  }

  @override
  String? get searchFieldLabel => AppStrings.searchInQuran.tr();

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor:
            theme.scaffoldBackgroundColor, // Custom background color
        iconTheme: IconThemeData(
          color: theme.colorScheme.primary,
        ), // Custom icon color
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<QuranSearchModel> matchQuery = [];
    List<QuranModel> quranList = QuranCubit.get(context).quranData;
    for (var item in quranSearchData) {
      if (item.text.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return query.trim() == ""
        ? Container()
        : ListView.separated(
            itemCount: matchQuery.length,
            itemBuilder: (BuildContext context, int index) {
              var result = matchQuery[index];
              return ListTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppPadding.p5.h),
                  child: Text(
                    result.text,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: FontConstants.uthmanTNFontFamily,
                        wordSpacing: AppSize.s5.w,
                        letterSpacing: AppSize.s0_1.w,
                        height: AppSize.s1.h),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textDirection: ui.TextDirection.rtl,
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppPadding.p5.h),
                  child: Text(
                    "سورة ${surahsNames[result.surahNumber]}",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: FontConstants.meQuranFontFamily,
                        color: Theme.of(context).unselectedWidgetColor,
                        wordSpacing: AppSize.s5.w,
                        letterSpacing: AppSize.s0_1.w),
                    textDirection: ui.TextDirection.rtl,
                  ),
                ),
                onTap: () {
                  close(context, null);
                  Navigator.pushNamed(
                    context,
                    Routes.quranRoute,
                    arguments: {
                      'quranList': quranList,
                      'pageNo': getPageNumber(quran: quranList, result: result),
                    },
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return getSeparator(context);
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<QuranSearchModel> matchQuery = [];
    List<QuranModel> quranList = QuranCubit.get(context).quranData;
    for (var item in quranSearchData) {
      if (item.text.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return query.trim() == ""
        ? Container()
        : ListView.separated(
            itemCount: matchQuery.length,
            itemBuilder: (BuildContext context, int index) {
              var result = matchQuery[index];
              return ListTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppPadding.p5.h),
                  child: Text(
                    result.text,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: FontConstants.uthmanTNFontFamily,
                        wordSpacing: AppSize.s5.w,
                        letterSpacing: AppSize.s0_1.w,
                        height: AppSize.s1.h),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textDirection: ui.TextDirection.rtl,
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppPadding.p5.h),
                  child: Text(
                    "سورة ${surahsNames[result.surahNumber]}",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: FontConstants.meQuranFontFamily,
                        color: Theme.of(context).unselectedWidgetColor,
                        wordSpacing: AppSize.s5.w,
                        letterSpacing: AppSize.s0_1.w),
                    textDirection: ui.TextDirection.rtl,
                  ),
                ),
                onTap: () {
                  close(context, null);
                  Navigator.pushNamed(
                    context,
                    Routes.quranRoute,
                    arguments: {
                      'quranList': quranList,
                      'pageNo': getPageNumber(quran: quranList, result: result),
                    },
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return getSeparator(context);
            },
          );
  }

  int getPageNumber({
    required List<QuranModel> quran,
    required QuranSearchModel result,
  }) {
    int pageNumber = 0;
    for (var i = 0; i < quran.length; i++) {
      final surah = quran[i];
      final List<AyahModel> ayahs = surah.ayahs;
      for (var ayah in ayahs) {
        if (ayah.number == result.id) {
          pageNumber = ayah.page;
        }
      }
    }
    return pageNumber;
  }
}
