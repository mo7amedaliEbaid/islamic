import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/utils/constants.dart';
import '../../../di/di.dart';
import '../../../app/utils/functions.dart';
import '../../../domain/models/adhkar/adhkar_model.dart';
import '../../components/separator.dart';
import '../../home/screens/adhkar/cubit/adhkar_cubit.dart';
import '../../../app/resources/resources.dart';


class DhikrBuilderView extends StatelessWidget {
  final List<AdhkarModel> adhkarList;
  final String category;
  final PageController _pageController = instance<PageController>();

  DhikrBuilderView({Key? key, required this.adhkarList, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AdhkarCubit.get(context).resetCounter();
        return true;
      },
      child: BlocBuilder<AdhkarCubit, AdhkarState>(
        builder: (context, state) {
          AdhkarCubit cubit = AdhkarCubit.get(context);

          final List<AdhkarModel> adhkarFromCategory =
              cubit.getAdhkarFromCategory(
                  adhkarList: adhkarList, category: category);
          //Get Current App Locale
          final currentLocale = context.locale;

          //Check if current app language is English
          bool isEnglish =
              currentLocale.languageCode == LanguageType.english.getValue();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                adhkarFromCategory[0].category,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: ColorManager.gold),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(AppPadding.p8.r),
              child: PageView.builder(
                reverse: isEnglish,
                controller: _pageController,
                itemCount: adhkarFromCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  int count = cubit.count;
                  return Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: AppPadding.p8.h),
                        child: Text(
                          "${(index + 1).toString().tr()} / ${adhkarFromCategory.length.toString().tr()}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontFamily: FontConstants.uthmanTNFontFamily,
                                  height: AppSize.s1.h,
                                  color:
                                      Theme.of(context).unselectedWidgetColor),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              adhkarFromCategory[index]
                                  .dhikr
                                  .replaceAll("(", "")
                                  .replaceAll(")", "")
                                  .replaceAll(".", "")
                                  .replaceAll("﴿", "")
                                  .replaceAll("﴾", ""),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    height: calculateFontLineHeight(
                                        adhkarFromCategory[index]
                                            .dhikr
                                            .replaceAll("(", "")
                                            .replaceAll(")", "")
                                            .replaceAll(".", "")
                                            .length),
                                    fontSize: calculateFontSize(
                                        adhkarFromCategory[index]
                                            .dhikr
                                            .replaceAll("(", "")
                                            .replaceAll(")", "")
                                            .replaceAll(".", "")
                                            .length),
                                  ),
                            ),
                            Text(
                              adhkarFromCategory[index].reference.isNotEmpty
                                  ? "${AppStrings.adhkarReference.tr()}: ${adhkarFromCategory[index].reference}"
                                  : Constants.empty,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      height: AppSize.s1.h,
                                      color: Theme.of(context)
                                          .unselectedWidgetColor),
                            ),
                            SizedBox(
                              height: AppSize.s8.h,
                            ),
                            Text(
                              adhkarFromCategory[index].description.isNotEmpty
                                  ? "${AppStrings.adhkarReward.tr()}: ${adhkarFromCategory[index].description}"
                                  : Constants.empty,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      height: AppSize.s1.h,
                                      color: Theme.of(context)
                                          .unselectedWidgetColor),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppPadding.p12.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            getSeparator(context),
                            Padding(
                              padding: EdgeInsets.only(bottom: AppPadding.p8.h),
                              child: Text(
                                "${count.toString().tr()} / ${adhkarFromCategory[index].count.isEmpty ? 1.toString().tr() : adhkarFromCategory[index].count.tr()}",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      height: AppSize.s1.h,
                                      fontFamily:
                                          FontConstants.uthmanTNFontFamily,
                                    ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).secondaryHeaderColor,
                                enableFeedback: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s8.r),
                                ),
                              ),
                              onPressed: () {
                                cubit.dhikrCounter(
                                  int.parse(
                                      adhkarFromCategory[index].count.isEmpty
                                          ? "1"
                                          : adhkarFromCategory[index].count),
                                  _pageController,
                                );
                              },
                              child: SvgPicture.asset(
                                ImageAsset.adhkarIcon,
                                width: AppSize.s50.h,
                                height: AppSize.s50.h,
                                colorFilter: const ColorFilter.mode(
                                    ColorManager.gold, BlendMode.srcIn),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
