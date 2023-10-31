import 'dart:ui';

enum LanguageType {
  english,
  arabic,
}

const String localisationPath = "assets/translations";

const String english = "en";
const String arabic = "ar";

const Locale englishLocale = Locale("en");
const Locale arabicLocale = Locale("ar");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}
