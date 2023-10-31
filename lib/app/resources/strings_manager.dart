class AppStrings {
  static const String noRouteFound = "no_route_found";
  static const String loading = "loading";
  static const String error = "error";
  static const String success = "success";
  static const String retryAgain = "retry_again";
  static const String dhikrValidateReturn = "dhikr_validate_return";
  static const String countValidateReturn = "count_validate_return";
  static const String ok = "ok";
  static const String doneTag = "Done Tag";
  static const String cancelTag = "Cancel Tag";
  static const String done = "done";
  static const String cancelButton = "cancel";
  static const String quran = "quran";
  static const String searchInQuran = "search_in_quran";
  static const String surahName = "surah_name";
  static const String pageNumber = "page_number";
  static const String juz = "juz";
  static const String hizb = "hizb";
  static const String firstOfSurahBasmalah =
      "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";
  static const String basmalah = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيم";
  static const String hadith = "hadith";
  static const String nawawi = "40_nawawi";
  static const String prayerTimes = "prayer_times";
  static const String enableLocation = "enable_location";
  static const String gettingLocation = "getting_location";
  static const String giveLocationAccessPermission =
      "give_location_access_permission";
  static const String noLocationFound = "no_location_found";
  static const String adhkar = "adhkar";
  static const String customAdhkar = "custom_adhkar";
  static const String number = "number";
  static const String dhikr = "dhikr";
  static const String count = "count";
  static const String adhkarDoaa = "adhkar_doaa";
  static const String adhkarReference = "adhkar_reference";
  static const String adhkarReward = "adhkar_reward";
  static const String addNewDhikr = "add_new_dhikr";
  static const String newDhikr = "new_dhikr";
  static const String newDhikrNumberOfRepetitions =
      "new_dhikr_number_of_repetitions";
  static const String noCustomAdhkar = "no_custom_adhkar";
  static const String add = "add";
  static const String settings = "settings";
  static const String changeAppLanguage = "change_app_language";
  static const String changeAppLanguageIcon = "change_app_language_icon";
  static const String changeAppTheme = "change_app_theme";
  static const String developer = "developer";
  static const String profile = "profile";
  static const String pillars = "pillars";
  static const String browse = "browse";

  static const List<String> hadithsTitles = [
    "hadith_1",
    "hadith_2",
    "hadith_3",
    "hadith_4",
    "hadith_5",
    "hadith_6",
    "hadith_7",
    "hadith_8",
    "hadith_9",
    "hadith_10",
    "hadith_11",
    "hadith_12",
    "hadith_13",
    "hadith_14",
    "hadith_15",
    "hadith_16",
    "hadith_17",
    "hadith_18",
    "hadith_19",
    "hadith_20",
    "hadith_21",
    "hadith_22",
    "hadith_23",
    "hadith_24",
    "hadith_25",
    "hadith_26",
    "hadith_27",
    "hadith_28",
    "hadith_29",
    "hadith_30",
    "hadith_31",
    "hadith_32",
    "hadith_33",
    "hadith_34",
    "hadith_35",
    "hadith_36",
    "hadith_37",
    "hadith_38",
    "hadith_39",
    "hadith_40",
    "hadith_41",
    "hadith_42"
  ];

  //Prayers names
  static const List<String> englishPrayerNames = [
    "Fajr",
    "Sunrise",
    "Dhuhr",
    "Asr",
    "Maghrib",
    "Isha",
  ];

  static const List<String> arabicPrayerNames = [
    "الفجر",
    "الشروق",
    "الظهر",
    "العصر",
    "المغرب",
    "العشاء",
  ];

  //error handler
  // static const String success = "Success"; //success with data
  static const String noContent = "no_content"; //success with no data
  static const String badRequest =
      "bad_request_error"; //failure, API rejected request
  static const String unauthorized =
      "unauthorized_error"; //failure, user is not authorized
  static const String forbidden =
      "forbidden_error"; //failure, API rejected request
  static const String notFound = "not_found_error";
  static const String internalServerError =
      "internal_server_error"; //failure, crash in server side

  //local status message
  static const String connectTimeout = "timeout_error";
  static const String cancel = "Request was cancelled, Try again later";
  static const String receiveTimeOut = "timeout_error";
  static const String sendTimeout = "timeout_error";
  static const String cacheError = "cache_error";
  static const String noInternetConnection = "no_internet_error";
  static const String unknown = "default_error";

  static String pillar1 =
      "الشهادتان هما الإعلان عن الإيمان من دون شك، وتصريح بأن ليس هناك إله في الوجود إلا الله، وأن محمداً رسول مرسل للناس من الله"
      "نص الشهادة هي: أشهد أن لا إله إلا الله وأشهد أن محمداً رسول الله."
      "وهذا النص يُقال يومياً في صلاة المسلمين، وهو أيضاً المفتاح الرئيسي لدخول شخص غير مسلم في الإسلام.";
  static String pillar2 =
      "الصلاة هي الركن الثاني من أركان الإسلام، لقول النبي محمد-ﷺ -: «بني الإسلام على خمس: شهادة أن لا إله إلا الله وأن محمداً رسول الله، وإقام الصلاة، وإيتاء الزكاة، وصوم رمضان، وحج البيت من استطاع إليه سبيلاً»،"
      "وقوله أيضاً: «رأس الأمر الإسلام، وعموده الصلاة، وذروة سنامه الجهاد في سبيل الله»، والصلاة واجبة على كل مسلم، بالغ، عاقل، ذكر كان أو أنثى،"
      "قد فرضت الصلاة في مكة قبل هجرة النبي محمد إلى يثرب في السنة الثالثة من البعثة النبوية، وذلك أثناء رحلة الإسراء والمعراج بحسب المعتقد الإسلامي.";
  static String pillar3 =
      "وإيتاء الزكاة هو عبادة مالية فرضها الله على عباده، طهرة لنفوسهم من البخل، ولصحائفهم من الخطايا، وقد ذكر الله في كتابه: ﴿خُذْ مِنْ أَمْوَالِهِمْ صَدَقَةً تُطَهِّرُهُمْ وَتُزَكِّيهِمْ بِهَا﴾ [التوبة:103]."
      "وقد فرض الله على المسلمين زكاتين، زكاة الفطر وهي التي تؤدى بعد شهر رمضان، وزكاة المال في أجناس مخصوصة."
      "وتُدفع الزكاة في مصارفها الثمانية للفقراء والمساكين.. ويسقط هذا الفرض عن الناس المعدمين الذين لا يملكون شيئاً.";
  static String pillar4 =
      "أما الصيام المفروض فهو:: صيام شهر رمضان. ويعتبر رمضان موسماً عظيماً تكثر فيه الطاعات وهو شهر مبارك تتنزل فيه الرحمة ويجدد فيه العبد عهده مع الله."
      "ويتقرب اليه بالطاعات. ولصيام رمضان فضائل عدّة، فقد تكفل الله لمن صامه إيمانا واحتسابا بغفران ما مضى من ذنوبه وغيرها من الفضائل والأجر لمن صامه إيماناً بالله واحتساباً للأجر.";
  static String pillar5 =
      "الحج هو زيارة المسجد الحرام في مكة المكرمة وأداء فريضة الحج. فرض الله هذا الفرض على كل مسلم بالغ، قادر على تحمّل تكاليف الحج. في القرآن: ﴿وَلِلَّهِ عَلَى النَّاسِ حِجُّ الْبَيْتِ مَنِ اسْتَطَاعَ إِلَيْهِ سَبِيلًا﴾ [آل عمران:97]."
      "وقد فرض الله الحج تزكيةً للنفوسِ، وتربيةً لها على معاني العبودية والطاعة والصبر، فضلاً على أنه فرصة عظيمة لتكفير الذنوب، فقد جاء في الحديث عن أبي هريرة: «من حج هذا البيت فلم يرفث ولم يفسق رجع كيوم ولدته أمه» البخاري ومسلم.";

static List<String> pillarsstring=[
  pillar1,
  pillar2,
  pillar3,
  pillar4,
  pillar5
];
}
