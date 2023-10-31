import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/utils/functions.dart';
import '../../components/separator.dart';
import '../../home/screens/adhkar/cubit/adhkar_cubit.dart';
import '../../../app/resources/resources.dart';


class CustomDhikrView extends StatelessWidget {
  final String customDhikrText;
  final int noOfRepetitions;

  const CustomDhikrView(
      {required this.customDhikrText, required this.noOfRepetitions, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AdhkarCubit.get(context).resetCounter();
        return true;
      },
      child: BlocBuilder<AdhkarCubit, AdhkarState>(
        builder: (BuildContext context, Object? state) {
          AdhkarCubit cubit = AdhkarCubit.get(context);
          int count = cubit.count;
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: EdgeInsets.all(AppPadding.p8.r),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          customDhikrText,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                height: AppSize.s1_25.h,
                                fontSize:
                                    calculateFontSize(customDhikrText.length),
                              ),
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
                            "${count.toString().tr()} / ${noOfRepetitions.toString().tr()}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  height: AppSize.s1.h,
                                  fontFamily: FontConstants.uthmanTNFontFamily,
                                ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).secondaryHeaderColor,
                            enableFeedback: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s8.r),
                            ),
                          ),
                          onPressed: () {
                            cubit.customDhikrCounter(
                              noOfRepetitions,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
