import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/models/quran/quran_model.dart';
import '../../../../common/components/components.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/language_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values.dart';
import '../cubit/quran_cubit.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {},
      builder: (context, state) {
        QuranCubit cubit = QuranCubit.get(context);
        List<QuranModel> quranList = cubit.quranData;

        //Get Current App Locale
        final currentLocale = context.locale;

        //Check if current app language is English
        bool isEnglish =
            currentLocale.languageCode == LanguageType.english.getValue();

        // if (state is QuranGetDataLoadingState) {
        //   return const Center(
        //       child: CircularProgressIndicator(color: ColorManager.gold));
        // } else {
        return ConditionalBuilder(
          condition: quranList.isNotEmpty,
          builder: (BuildContext context) {
            return Column(
              children: [
                ListTile(
                  style: ListTileStyle.list,
                  leading: Text(
                    AppStrings.number.tr(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: FontConstants.uthmanTNFontFamily),
                  ),
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: AppPadding.p5.h),
                    child: Text(
                      AppStrings.surahName.tr(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontFamily: FontConstants.uthmanTNFontFamily),
                    ),
                  ),
                  trailing: Text(
                    AppStrings.pageNumber.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: FontConstants.uthmanTNFontFamily),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => _surahsIndexItem(
                        surahId: (index + 1).toString().tr(),
                        surahName: quranList[index].name,
                        englishSurahName: quranList[index].englishName,
                        pageNo: quranList[index].ayahs[0].page,
                        quranList: quranList,
                        isEnglish: isEnglish,
                        context: context),
                    separatorBuilder: (context, index) => getSeparator(context),
                    itemCount: quranList.length,
                  ),
                ),
              ],
            );
          },
          fallback: (BuildContext context) {
            return const Center(
                child: CircularProgressIndicator(color: ColorManager.gold));
          },
        );

        // if (cubit.isThereABookMarkedPage)
        //   return Scaffold(
        //   // if (cubit.isThereABookMarkedPage)
        //     floatingActionButton: isThereABookMarkedPage ?
        //   FloatingActionButton(
        //       onPressed: () {
        //         Navigator.pushNamed(
        //           context,
        //           Routes.testRoute,
        //           arguments: {
        //             'quranList': quranList,
        //             'pageNo': cubit.getBookMarkPage(),
        //           },
        //         );
        //       },
        //       backgroundColor:
        //           // ColorManager.lightPrimary,
        //           ColorManager.darkSecondary,
        //       child: const Icon(
        //         Icons.bookmark,
        //         color: ColorManager.gold,
        //       ),
        //   ) : Container(),
        //     // ),
        //   // ),
        //     // appBar: AppBar(
        //     //   elevation: Constants.zero.toDouble(),
        //     //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //     //   leading: FloatingActionButton(
        //     //     onPressed: () {
        //     //       Navigator.pushNamed(
        //     //         context,
        //     //         Routes.testRoute,
        //     //         arguments: {
        //     //           'quranList': state.quranList,
        //     //           'pageNo': cubit.getBookMarkPage(),
        //     //         },
        //     //       );
        //     //     },
        //     //     backgroundColor:
        //     //         // ColorManager.lightPrimary,
        //     //         ColorManager.darkSecondary,
        //     //     child: const Icon(
        //     //       Icons.bookmark,
        //     //       color: ColorManager.gold,
        //     //     ),
        //     //   ),
        //     // ),
        //     body: ListView.separated(
        //       physics: const BouncingScrollPhysics(),
        //       itemBuilder: (context, index) => _surahsIndexItem(
        //           surahId: (index + 1).toString().tr(),
        //           surahName: quranList[index].name,
        //           englishSurahName: quranList[index].englishName,
        //           pageNo: quranList[index].ayahs[0].page,
        //           quranList: quranList,
        //           isEnglish: isEnglish,
        //           context: context),
        //       separatorBuilder: (context, index) => getSeparator(context),
        //       itemCount: quranList.length,
        //     ),
        //   );

        // return ListView.separated(
        //   physics: const BouncingScrollPhysics(),
        //   itemBuilder: (context, index) => _surahsIndexItem(
        //       surahId: (index + 1).toString().tr(),
        //       surahName: state.quranList[index].name,
        //       englishSurahName: state.quranList[index].englishName,
        //       pageNo: state.quranList[index].ayahs[0].page,
        //       quranList: state.quranList,
        //       isEnglish: isEnglish,
        //       context: context),
        //   separatorBuilder: (context, index) => getSeparator(context),
        //   itemCount: state.quranList.length,
        // );
        // }
      },
    );
  }

  Widget _surahsIndexItem(
      {required String surahId,
      required String surahName,
      required String englishSurahName,
      required int pageNo,
      required List<QuranModel> quranList,
      required bool isEnglish,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p5.h),
      child: ListTile(
        style: ListTileStyle.list,
        leading: Padding(
          padding: EdgeInsets.only(top: AppPadding.p5.h),
          child: Text(
            surahId,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontFamily: FontConstants.uthmanTNFontFamily),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: AppPadding.p5.h),
          child: Text(
            isEnglish ? englishSurahName : surahName,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontFamily: FontConstants.meQuranFontFamily,
                wordSpacing: AppSize.s5.w,
                letterSpacing: AppSize.s0_1.w),
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.symmetric(vertical: AppPadding.p5.h),
          child: Text(
            isEnglish ? surahName : englishSurahName,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontFamily: FontConstants.meQuranFontFamily,
                color: Theme.of(context).unselectedWidgetColor,
                wordSpacing: AppSize.s5.w,
                letterSpacing: AppSize.s0_1.w),
          ),
        ),
        trailing: Text(
          pageNo.toString().tr(),
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontFamily: FontConstants.uthmanTNFontFamily),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.quranRoute,
            arguments: {
              'quranList': quranList,
              'pageNo': pageNo,
            },
          );
        },
      ),
    );
  }
}
