import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/presentation/common/components/components.dart';
import 'package:islamic/presentation/resources/assets_manager.dart';
import 'package:islamic/presentation/resources/routes_manager.dart';
import 'package:islamic/presentation/resources/strings_manager.dart';
import 'package:islamic/presentation/resources/styles_manager.dart';
import 'package:islamic/presentation/resources/values.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: AppSize.s200 * 1.2,
      child: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p40),
        child: Column(
          children: [
            Container(
              height: AppSize.s140,
              width: AppSize.s160,
              margin: EdgeInsets.symmetric(vertical: AppMargin.m20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageAsset.launcherIcon),
                      fit: BoxFit.fill)),
            ),
            _draweritem(AppStrings.pillars.tr(), () {
              Navigator.of(context).pushNamed(Routes.pillarsRoute);
            }),
            getSeparator(context),
            _draweritem(AppStrings.browse.tr(), () {
              Navigator.of(context).pushNamed(Routes.browsenetRoute);
            })
          ],
        ),
      ),
    );
  }

  _draweritem(String title, void Function() ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(top: AppMargin.m16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text(title,style: TextStyle(fontSize: AppSize.s20),), Icon(Icons.double_arrow)],
        ),
      ),
    );
  }
}
