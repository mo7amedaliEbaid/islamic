import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/models/hadith/hadith_model.dart';
import '../../../../components/separator.dart';
import '../../../../../app/resources/resources.dart';

import '../cubit/hadith_cubit.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithCubit, HadithState>(
      builder: (context, state) {
        HadithCubit cubit = HadithCubit.get(context);
        List<HadithModel> hadithList = cubit.hadithList;

        //Get Current App Locale
        final currentLocale = context.locale;

        //Check if current app language is English
        bool isEnglish =
            currentLocale.languageCode == LanguageType.english.getValue();
        return ConditionalBuilder(
          condition: hadithList.isNotEmpty,
          builder: (BuildContext context) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => _hadithsIndexItem(
                  hadithModel: hadithList[index],
                  isEnglish: isEnglish,
                  index: index,
                  context: context),
              separatorBuilder: (context, index) => getSeparator(context),
              itemCount: hadithList.length,
            );
          },
          fallback: (BuildContext context) {
            return const Center(
                child: CircularProgressIndicator(color: ColorManager.gold));
          },
        );
      },
    );
  }

  Widget _hadithsIndexItem(
      {required HadithModel hadithModel,
      required bool isEnglish,
      required int index,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p5.h),
      child: ListTile(
        style: ListTileStyle.list,
        leading: Padding(
          padding: EdgeInsets.only(top: AppPadding.p5.h),
          child: Text(
            (index + 1).toString().tr(),
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontFamily: FontConstants.uthmanTNFontFamily),
          ),
        ),
        title: Text(
          AppStrings.hadithsTitles[index].tr(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontFamily: FontConstants.elMessiriFontFamily,
              ),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.hadithRoute,
            arguments: {
              'hadithModel': hadithModel,
            },
          );
        },
      ),
    );
  }
}
