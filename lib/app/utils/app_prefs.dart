
import 'package:flutter/material.dart';
import 'package:islamic/app/utils/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../di/di.dart';
import '../resources/resources.dart';

const String prefsLangKey = "LANG_KEY";
const String themeModeKey = "THEME_MODE_KEY";
const String bookMarkPageKey = "BOOK_MARK_PAGE_KEY";
const String bookMarkPageBoolKey = "BOOK_MARK_PAGE_BOOL_KEY";

class AppPreferences {
  final SharedPreferences _preferences = instance<SharedPreferences>();

  AppPreferences();

  Future<String> getAppLanguage() async {
    String? language = _preferences.getString(prefsLangKey);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.arabic.getValue();
    }
  }

  Future changeAppLanguage() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.arabic.getValue()) {
      _preferences.setString(prefsLangKey, LanguageType.english.getValue());
    } else {
      _preferences.setString(prefsLangKey, LanguageType.arabic.getValue());
    }
  }

  Future<Locale> getAppLocale() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.arabic.getValue()) {
      return arabicLocale;
    } else {
      return englishLocale;
    }
  }

  ThemeMode getAppTheme() {
    String? themeMode = _preferences.getString(themeModeKey);
    if (themeMode != null && themeMode.isNotEmpty) {
      if (themeMode == ThemeType.dark.getValue()) {
        return ThemeMode.dark;
      } else {
        return ThemeMode.light;
      }
    } else {
      return ThemeMode.light;
    }
  }

  void changeAppTheme() {
    ThemeMode currentTheme = getAppTheme();
    if (currentTheme == ThemeMode.dark) {
      _preferences.setString(themeModeKey, ThemeType.light.getValue());
    } else {
      _preferences.setString(themeModeKey, ThemeType.dark.getValue());
    }
  }

  Future<void> bookMarkPage(int quranPageNumber) async {
    await _preferences
        .setInt(bookMarkPageKey, quranPageNumber)
        .then((value) => _preferences.setBool(bookMarkPageBoolKey, true));
  }

  Future<void> removeBookMarkPage() async {
    await _preferences
        .remove(bookMarkPageKey)
        .then((value) => _preferences.setBool(bookMarkPageBoolKey, false));
  }

  int? getBookMarkedPage() {
    return _preferences.getInt(bookMarkPageKey);
  }

  bool isPageBookMarked(int quranPageNumber) {
    return quranPageNumber == _preferences.getInt(bookMarkPageKey);
  }

  Future<bool> isThereABookMarked() async {
    return _preferences.getBool(bookMarkPageBoolKey).orFalse();
  }
}
