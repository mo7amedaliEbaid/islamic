
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic/app/resources/styles_manager.dart';
import 'package:islamic/app/resources/values.dart';


import 'color_manager.dart';
import 'font_manager.dart';

enum ThemeType {
  dark,
  light,
}

const String dark = "dark";
const String light = "light";

ThemeMode currentThemeMode = ThemeMode.system;

extension ThemeTypeExtension on ThemeType {
  String getValue() {
    switch (this) {
      case ThemeType.dark:
        return dark;
      case ThemeType.light:
        return light;
    }
  }
}

ThemeData getApplicationLightTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: ColorManager.lightPrimary,
    secondaryHeaderColor: ColorManager.white,
    scaffoldBackgroundColor: ColorManager.lightBackground,
    canvasColor: ColorManager.lightPrimary,
    splashColor: ColorManager.gold,
    disabledColor: ColorManager.lightGrey,
    shadowColor: ColorManager.lightSecondary,
    unselectedWidgetColor: ColorManager.lightGrey,

    colorScheme: const ColorScheme(
      background: ColorManager.lightBackground,
      brightness: Brightness.light,
      primary: ColorManager.lightPrimary,
      onPrimary: ColorManager.lightSecondary,
      secondary: ColorManager.lightSecondary,
      onSecondary: ColorManager.lightPrimary,
      error: ColorManager.error,
      onError: ColorManager.lightPrimary,
      onBackground: ColorManager.lightPrimary,
      surface: ColorManager.lightPrimary,
      onSurface: ColorManager.lightSecondary,
    ),
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.lightSecondary,
      elevation: AppSize.s4.r,
    ),
    appBarTheme: AppBarTheme(
      color: ColorManager.lightPrimary,
      centerTitle: true,
      elevation: AppSize.s4.r,
      shadowColor: ColorManager.lightSecondary,
      titleTextStyle: TextStyle(
        fontFamily: FontConstants.meQuranFontFamily,
        fontWeight: FontWeightsManager.medium,
        color: ColorManager.gold,
        wordSpacing: AppSize.s5.w,
        letterSpacing: AppSize.s0_1.w,
      ),
      iconTheme: const IconThemeData(
        color: ColorManager.white,
      ),
    ),

    iconTheme: IconThemeData(color: ColorManager.black, size: AppSize.s24.r),

    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: ColorManager.lightPrimary,
      disabledColor: ColorManager.lightGrey,
      splashColor: ColorManager.gold,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.lightPrimary,
        disabledBackgroundColor: ColorManager.lightGrey,
        foregroundColor: ColorManager.gold,
        disabledForegroundColor: ColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14.r),
        ),
        textStyle: getSemiBoldStyle(fontSize: FontSize.s14.r),
      ),
    ),
    textTheme: TextTheme(
      displayLarge:
          getBoldStyle(fontSize: FontSize.s32, color: ColorManager.gold),
      displayMedium:
          getBoldStyle(fontSize: FontSize.s28, color: ColorManager.gold),
      displaySmall:
          getBoldStyle(fontSize: FontSize.s24, color: ColorManager.gold),

      //Headline
      headlineLarge:
          getSemiBoldStyle(fontSize: FontSize.s20, color: ColorManager.gold),
      headlineMedium:
          getSemiBoldStyle(fontSize: FontSize.s18, color: ColorManager.gold),
      headlineSmall:
          getSemiBoldStyle(fontSize: FontSize.s16, color: ColorManager.gold),

      //Title
      titleLarge:
          getMediumStyle(fontSize: FontSize.s20, color: ColorManager.black),
      titleMedium:
          getMediumStyle(fontSize: FontSize.s18, color: ColorManager.black),
      titleSmall:
          getMediumStyle(fontSize: FontSize.s16, color: ColorManager.black),

      //Body
      bodyLarge:
          getRegularStyle(fontSize: FontSize.s18, color: ColorManager.black),
      bodyMedium:
          getRegularStyle(fontSize: FontSize.s16, color: ColorManager.black),
      bodySmall:
          getRegularStyle(fontSize: FontSize.s14, color: ColorManager.black),

      //label
      //text button
      labelLarge:
          getRegularStyle(fontSize: FontSize.s14, color: ColorManager.gold),
      //button label
      labelMedium:
          getRegularStyle(fontSize: FontSize.s12, color: ColorManager.gold),
      //caption
      labelSmall: getRegularStyle(
        fontSize: FontSize.s10,
        color: ColorManager.lightGrey,
      ),
    ),

    //input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8.w),
      hintStyle: getRegularStyle(
        fontSize: FontSize.s12,
        color: ColorManager.lightGrey,
      ),
      labelStyle: getMediumStyle(
        fontSize: FontSize.s12,
        color: ColorManager.lightGrey,
      ),
      errorStyle: getRegularStyle(
        fontSize: FontSize.s10,
        color: ColorManager.error,
      ),

      //enabled border style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightGrey,
          width: AppSize.s1_5.r,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),

      //focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightPrimary,
          width: AppSize.s1_5.r,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),

      //error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5.r,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),
    ),
  );
}

ThemeData getApplicationLDarkTheme() {
  return ThemeData(
    useMaterial3: true,

    //colors
    primaryColor: ColorManager.darkPrimary,
    secondaryHeaderColor: ColorManager.darkSecondary,
    scaffoldBackgroundColor: ColorManager.darkBackground,
    canvasColor: ColorManager.darkPrimary,
    splashColor: ColorManager.gold,
    disabledColor: ColorManager.darkGrey,
    shadowColor: ColorManager.darkPrimary,
    unselectedWidgetColor: ColorManager.darkGrey,

    colorScheme: const ColorScheme(
      background: ColorManager.darkBackground,
      brightness: Brightness.dark,
      primary: ColorManager.darkSecondary,
      onPrimary: ColorManager.darkPrimary,
      secondary: ColorManager.darkSecondary,
      onSecondary: ColorManager.darkPrimary,
      error: ColorManager.error,
      onError: ColorManager.darkPrimary,
      onBackground: ColorManager.darkSecondary,
      surface: ColorManager.darkPrimary,
      onSurface: ColorManager.darkSecondary,
    ),

    //cardView theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.black,
        elevation: AppSize.s4.r),

    // appBarTheme
    appBarTheme: AppBarTheme(
      color: ColorManager.darkPrimary,
      centerTitle: true,
      elevation: AppSize.s4.r,
      shadowColor: ColorManager.darkPrimary,
      titleTextStyle: const TextStyle(
        // fontSize: FontSize.s24,
        fontFamily: FontConstants.meQuranFontFamily,
        fontWeight: FontWeightsManager.medium,
        color: ColorManager.gold,
        // wordSpacing: 5,
        // letterSpacing: 0.1,
      ),
      iconTheme: const IconThemeData(
        color: ColorManager.white,
      ),
    ),

    iconTheme: IconThemeData(color: ColorManager.white, size: AppSize.s24.r),

    //button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: ColorManager.darkPrimary,
      disabledColor: ColorManager.darkGrey,
      splashColor: ColorManager.darkSecondary,
    ),

    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.darkSecondary,
        disabledBackgroundColor: ColorManager.darkGrey,
        foregroundColor: ColorManager.gold,
        disabledForegroundColor: ColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14.r),
        ),
        textStyle: getSemiBoldStyle(fontSize: FontSize.s14.r),
      ),
    ),

    //text theme
    textTheme: TextTheme(
      //Display
      displayLarge:
          getBoldStyle(fontSize: FontSize.s32, color: ColorManager.gold),
      displayMedium:
          getBoldStyle(fontSize: FontSize.s28, color: ColorManager.gold),
      displaySmall:
          getBoldStyle(fontSize: FontSize.s24, color: ColorManager.gold),

      //Headline
      headlineLarge:
          getSemiBoldStyle(fontSize: FontSize.s20, color: ColorManager.gold),
      headlineMedium:
          getSemiBoldStyle(fontSize: FontSize.s18, color: ColorManager.gold),
      headlineSmall:
          getSemiBoldStyle(fontSize: FontSize.s16, color: ColorManager.gold),

      //Title
      titleLarge: getMediumStyle(fontSize: FontSize.s20),
      titleMedium: getMediumStyle(fontSize: FontSize.s18),
      titleSmall: getMediumStyle(fontSize: FontSize.s16),

      //Body
      bodyLarge: getRegularStyle(fontSize: FontSize.s18),
      bodyMedium: getRegularStyle(fontSize: FontSize.s16),
      bodySmall: getRegularStyle(fontSize: FontSize.s14),

      //label
      labelLarge:
          getRegularStyle(fontSize: FontSize.s14, color: ColorManager.gold),
      //text button
      labelMedium: getRegularStyle(fontSize: FontSize.s12),
      //button label
      labelSmall: getRegularStyle(
          fontSize: FontSize.s10, color: ColorManager.darkGrey), //caption
    ),

    //input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8.w),
      hintStyle: getRegularStyle(
        fontSize: FontSize.s14,
        color: ColorManager.darkGrey,
      ),
      labelStyle: getMediumStyle(
        fontSize: FontSize.s14,
        color: ColorManager.darkGrey,
      ),
      errorStyle: getRegularStyle(
        fontSize: FontSize.s12,
        color: ColorManager.error,
      ),

      //enabled border style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.darkGrey,
          width: AppSize.s1_5.r,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),

      //focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.darkSecondary,
          width: AppSize.s1_5.r,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),

      //error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5.r,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8.r),
      ),
    ),
  );
}
