import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils/constants.dart';
import '../../../app/utils/functions.dart';
import '../../../domain/models/quran/quran_model.dart';
import '../../components/separator.dart';
import '../../home/cubit/home_cubit.dart';
import '../../home/screens/quran/cubit/quran_cubit.dart';
import '../../../../../app/resources/resources.dart';


class SurahBuilderView extends StatelessWidget {
  final List<QuranModel> quranList;
  final int pageNo;

  const SurahBuilderView(
      {Key? key, required this.quranList, required this.pageNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        isThereABookMarkedPage =
            await HomeCubit.get(context).isThereABookMarked();
        return true;
      },
      child: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          QuranCubit cubit = QuranCubit.get(context);
          HomeCubit homeCubit = HomeCubit.get(context);
          bool darkMode = homeCubit.darkModeOn(context);
          final PageController pageController =
              PageController(initialPage: pageNo - 1);

          //Get Current App Locale
          final currentLocale = context.locale;

          //Check if current app language is English
          bool isEnglish =
              currentLocale.languageCode == LanguageType.english.getValue();

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(AppPadding.p8.r),
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: isEnglish,
                  controller: pageController,
                  itemCount: 604,
                  itemBuilder: (BuildContext context, int index) {
                    var quranPageNumber = index + 1;
                    final List<QuranModel> pageSurahsList = cubit.getPageSurahs(
                        quran: quranList, pageNo: quranPageNumber);
                    final List<String> pageSurahsNamesList =
                        List.of(pageSurahsList.map((surah) => surah.name));

                    final String surahNameOnScreen = pageSurahsNamesList.first;
                    final List<AyahModel> ayahs = cubit.getAyahsFromPageNo(
                        quranList: quranList, pageNo: quranPageNumber);
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${AppStrings.juz.tr()}: ${ayahs.first.juz.toString().tr()}، ${AppStrings.hizb.tr()}: ${((ayahs.first.hizbQuarter / 4).ceil()).toString().tr()} ",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                      fontFamily:
                                          FontConstants.uthmanTNFontFamily,
                                      color: Theme.of(context)
                                          .unselectedWidgetColor),
                            ),
                            Text(
                              surahNameOnScreen,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                      wordSpacing: AppSize.s5.w,
                                      letterSpacing: AppSize.s0_1.w,
                                      fontFamily:
                                          FontConstants.meQuranFontFamily,
                                      color: Theme.of(context)
                                          .unselectedWidgetColor),
                            ),
                          ],
                        ),
                        getSeparator(context),
                        //Quran with Images
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              "assets/images/quran/page${getQuranImageNumberFromPageNumber(quranPageNumber)}.png",
                              color: darkMode ? Colors.white : null,
                              colorBlendMode: BlendMode.srcIn,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          heroTag: Text("$quranPageNumber"),
                          onPressed: () {
                            homeCubit.bookMarkPage(quranPageNumber);
                          },
                          backgroundColor: darkMode
                              ? ColorManager.darkSecondary
                              : ColorManager.lightPrimary,
                          child: Icon(
                            homeCubit.isPageBookMarked(quranPageNumber)
                                ? Icons.bookmark
                                : Icons.bookmark_add_outlined,
                            color: ColorManager.gold,
                          ),
                        ),
                        getSeparator(context),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: AppPadding.p8.h),
                          child: Text(
                            (quranPageNumber).toString().tr(),
                            textAlign: TextAlign.justify,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontFamily:
                                        FontConstants.uthmanTNFontFamily,
                                    height: AppSize.s1.h,
                                    color: Theme.of(context)
                                        .unselectedWidgetColor),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
