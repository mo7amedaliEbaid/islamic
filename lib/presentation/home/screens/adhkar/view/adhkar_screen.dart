import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic/app/utils/extensions.dart';

import '../../../../../domain/models/adhkar/adhkar_model.dart';
import '../../../../common/components/components.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/values.dart';
import '../cubit/adhkar_cubit.dart';

class AdhkarScreen extends StatelessWidget {
  const AdhkarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdhkarCubit, AdhkarState>(
      listener: (context, state) {},
      builder: (context, state) {
        AdhkarCubit cubit = AdhkarCubit.get(context);
        List<AdhkarModel> adhkarList = cubit.adhkarList;
        return ConditionalBuilder(
          condition: adhkarList.isNotEmpty,
          builder: (BuildContext context) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _adhkarIndexItem(
                    adhkarId: (index + 1).toString().tr(),
                    adhkarCategory: cubit
                        .getAdhkarCategories(adhkarList: adhkarList)[index]
                        .orEmpty(),
                    adhkarList: adhkarList,
                    index: index,
                    context: context);
              },
              separatorBuilder: (context, index) => getSeparator(context),
              itemCount:
                  cubit.getAdhkarCategories(adhkarList: adhkarList).length,
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

  Widget _adhkarIndexItem(
      {required String adhkarId,
      required String adhkarCategory,
      required List<AdhkarModel> adhkarList,
      required int index,
      // required String pageNo,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p5.h),
      child: ListTile(
        style: ListTileStyle.list,
        leading: Padding(
          padding: EdgeInsets.only(top: AppPadding.p5.h),
          child: Text(
            adhkarId,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontFamily: FontConstants.uthmanTNFontFamily),
          ),
        ),
        title: Text(
          adhkarCategory,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontFamily: FontConstants.elMessiriFontFamily,
              ),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.adhkarRoute,
            arguments: {
              'adhkarList': adhkarList,
              'category': adhkarCategory,
            },
          );
        },
      ),
    );
  }
}
