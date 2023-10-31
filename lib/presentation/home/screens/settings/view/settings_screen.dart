import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../app/utils/functions.dart';
import '../../../../components/separator.dart';
import '../../../../../app/resources/resources.dart';

import '../../../cubit/home_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        bool darkMode = cubit.darkModeOn(context);
        return ListView(
          children: [
            _settingIndexItem(
              icon: Icons.language_outlined,
              settingName: AppStrings.changeAppLanguage.tr(),
              trailing: Text(
                AppStrings.changeAppLanguageIcon.tr(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: FontConstants.elMessiriFontFamily,
                      height: AppSize.s1_8.h,
                    ),
              ),
              onTap: () {
                cubit.changeAppLanguage(context);
              },
              context: context,
            ),
            getSeparator(context),
            _settingIndexItem(
              icon: Icons.brightness_2_outlined,
              settingName: AppStrings.changeAppTheme.tr(),
              trailing: Switch(
                overlayColor: MaterialStateColor.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return ColorManager.lightPrimary;
                  } else {
                    return ColorManager.gold;
                  }
                }),
                activeTrackColor: ColorManager.darkSecondary,
                thumbIcon: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return const Icon(
                      Icons.brightness_2_outlined,
                      color: ColorManager.white,
                    );
                  } else {
                    return const Icon(
                      Icons.brightness_5,
                      color: ColorManager.white,
                    );
                  }
                }),
                inactiveTrackColor: ColorManager.lightBackground,
                thumbColor: MaterialStateColor.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return ColorManager.lightPrimary;
                  } else {
                    return ColorManager.gold;
                  }
                }),
                value: darkMode,
                onChanged: (value) {
                  cubit.changeAppTheme(context);
                },
              ),
              onTap: () {
                cubit.changeAppTheme(context);
              },
              context: context,
            ),
            getSeparator(context),
            _settingIndexItem(
              icon: Icons.star_border,
              settingName: AppStrings.developer.tr(),
              trailing: null,
              onTap: () async {
                await launchUrl(getUri("https://github.com/mo7amedaliEbaid/islamic"),
                    mode: LaunchMode.externalApplication);
              },
              context: context,
            ),
            getSeparator(context),
            SizedBox(height: AppSize.s35,),
            Image.asset(ImageAsset.launcherIcon,height:AppSize.s190,)
          ],
        );
      },
    );
  }

  Widget _settingIndexItem(
      {required IconData? icon,
      required String settingName,
      required Widget? trailing,
      required Function onTap,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p5.h),
      child: ListTile(
        leading: Padding(
          padding: EdgeInsets.only(top: AppPadding.p5.h),
          child: Icon(
            icon,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Text(
          settingName,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontFamily: FontConstants.elMessiriFontFamily,
                wordSpacing: AppSize.s3.w,
                letterSpacing: AppSize.s0_5.w,
                height: AppSize.s2_4.h,
              ),
        ),
        trailing: trailing,
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
